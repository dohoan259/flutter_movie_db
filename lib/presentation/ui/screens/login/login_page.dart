import 'package:flutter/material.dart';
import 'package:flutter_movie_db/di/di.dart';
import 'package:flutter_movie_db/presentation/base/base_page.dart';
import 'package:flutter_movie_db/presentation/controller/auth_state.dart';
import 'package:flutter_movie_db/presentation/controller/login_controller.dart';
import 'package:flutter_movie_db/router/app_router.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<LoginController, AuthState>(
        create: (_) => getIt<LoginController>(),
        builder: (context, _) {
          return BasePage<LoginController, AuthState>(
            loadedView: Scaffold(
              backgroundColor: Colors.white54,
              body: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.red,
                    onSurface: Colors.grey,
                  ),
                  onPressed: () async {
                    final isLoggedIn =
                        await context.read<LoginController>().login();
                    if (isLoggedIn) {
                      Navigator.of(context)
                          .popAndPushNamed(AppRouter.HOME_PATH);
                    }
                  },
                  child: Text('Login'),
                ),
              ),
            ),
          );
        });
  }
}
