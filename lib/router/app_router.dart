import 'package:flutter/material.dart';
import 'package:flutter_movie_db/presentation/ui/screens/home/home_page.dart';
import 'package:flutter_movie_db/presentation/ui/screens/login/login_page.dart';

class AppRouter {
  static const HOME_PATH = '/home';
  static const LOGIN_PATH = '/login';
  static const POST_PATH = '/post';
  static const TEST_PATH = '/test';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_PATH:
        final loginPage = LoginPage();
        return MaterialPageRoute(
          builder: (_) => loginPage,
        );
      case HOME_PATH:
        final homePage = HomePage();
        return MaterialPageRoute(
          builder: (_) => homePage,
        );
      case POST_PATH:
        final homePage = HomePage();
        return MaterialPageRoute(
          builder: (_) => homePage,
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
