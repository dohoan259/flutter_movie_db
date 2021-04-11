import 'package:flutter/material.dart';
import 'package:flutter_movie_db/common/error_handler.dart';
import 'package:flutter_movie_db/common/error_listener.dart';
import 'package:flutter_movie_db/data/error_entity.dart';
import 'package:flutter_movie_db/presentation/ui/screens/error/unknown_error_page.dart';
import 'package:flutter_movie_db/presentation/ui/widgets/loading.dart';
import 'package:flutter_movie_db/presentation/ui/widgets/uninitialized_widget.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

import 'base_controller.dart';
import 'base_state.dart';

class BasePage<C extends BaseController, T extends BaseState>
    extends StatelessWidget {

  final Widget loadedView;

  final Widget? errorView;

  const BasePage({
    required this.loadedView,
    this.errorView,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Selector<T, ViewState>(
          selector: (context, model) => model.viewState,
          builder: (_, viewState, __) {
            if (viewState == ViewState.Uninitialized) {
              return UninitializedWidget();
            } else if (viewState == ViewState.Error) {
              // return errorView ?? UnknownErrorPage<C>();
              return ErrorListener.instance.handleError(NetworkException());
            } else {
              return Stack(
                children: [
                  Scaffold(
                    backgroundColor: Colors.black38,
                    body: loadedView,
                  ),
                  Selector<T, bool>(
                      builder: (_, processing, __) {
                        if (processing) {
                          return Loading(
                            opacity: 0.3,
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                      selector: (_, state) => state.processing)
                ],
              );
            }
          },
        ));
  }
}
