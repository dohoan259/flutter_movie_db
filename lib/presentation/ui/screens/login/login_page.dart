import 'package:flutter/material.dart';
import 'package:flutter_movie_db/presentation/base/base_page.dart';
import 'package:flutter_movie_db/presentation/controller/auth_state.dart';
import 'package:flutter_movie_db/presentation/controller/login_controller.dart';
import 'package:flutter_movie_db/router/app_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage<LoginController, AuthState>(
      loadedView: Scaffold(
        backgroundColor: Colors.white54,
        body: Center(
          child: FlatButton(
            color: Colors.red,
            onPressed: () async {
              final isLoggedIn = await context.read<LoginController>().login();
              if (isLoggedIn) {
                Navigator.of(context).popAndPushNamed(AppRouter.HOME_PATH);
              }
            },
            child: Text('Login'),
          ),
        ),
      ),
    );
  }
}
