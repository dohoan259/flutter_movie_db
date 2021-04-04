

import 'package:flutter/material.dart';
import 'package:flutter_movie_db/di/di.dart';
import 'package:flutter_movie_db/presentation/base/base_page.dart';
import 'package:flutter_movie_db/presentation/controller/home_controller.dart';
import 'package:flutter_movie_db/presentation/controller/home_state.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeController, HomeState>(
      create: (_) => getIt.get<HomeController>()..movieId = "movie id",
      builder: (context, child) {
        return BasePage<HomeController, HomeState>(
          loadedView: _buildContent(context),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
