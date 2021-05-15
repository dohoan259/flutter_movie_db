import 'package:flutter/material.dart';
import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';
import 'package:flutter_movie_db/di/di.dart';
import 'package:flutter_movie_db/presentation/base/base_page.dart';
import 'package:flutter_movie_db/presentation/controller/home_controller.dart';
import 'package:flutter_movie_db/presentation/controller/home_state.dart';
import 'package:flutter_movie_db/presentation/ui/widgets/movie_item_list.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeController, HomeState>(
      create: (_) => getIt.get<HomeController>(),
      builder: (context, child) {
        return BasePage<HomeController, HomeState>(
          loadedView: _buildContent(context),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Popular movie',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Selector<HomeState, List<GeneralMovie>>(
        selector: (_, state) => state.popularMovies,
        builder: (context, movieList, _) {
          return GridView.builder(
            addAutomaticKeepAlives: true,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: movieList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              final movie = movieList[index];
              final posterUrl = getIt.get<String>(instanceName: 'poster_url') +
                  movie.posterPath;
              return MovieItemList(
                posterPath: posterUrl,
              );
            },
          );
        },
      ),
    );
  }
}
