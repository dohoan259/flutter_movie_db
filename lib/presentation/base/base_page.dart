import 'package:flutter/material.dart';
import 'package:flutter_movie_db/data/result.dart';
import 'package:flutter_movie_db/presentation/ui/screens/error/unknown_error_page.dart';
import 'package:flutter_movie_db/presentation/ui/widgets/loading.dart';
import 'package:flutter_movie_db/presentation/ui/widgets/uninitialized_widget.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

import 'base_controller.dart';
import 'base_state.dart';

class BasePage<C extends BaseController, T extends BaseState>
    extends StatefulWidget {
  @override
  _BasePageState<C, T> createState() => _BasePageState<C, T>();

  final Function(Result)? onPageInitialized;

  final Widget loadedView;

  final Widget? errorView;

  const BasePage({
    this.onPageInitialized,
    required this.loadedView,
    this.errorView,
  });
}

class _BasePageState<C extends BaseController, T extends BaseState>
    extends State<BasePage> {
  @override
  void initState() {
    context.read<C>().loadData().then((result) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        widget.onPageInitialized?.call(result);
      });
    });
    super.initState();
  }

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
              return widget.errorView ?? UnknownErrorPage<C>();
            } else {
              return Stack(
                children: [
                  Scaffold(
                    backgroundColor: Colors.black38,
                    body: widget.loadedView,
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
