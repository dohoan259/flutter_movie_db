import 'package:flutter/material.dart';
import 'package:flutter_movie_db/presentation/ui/screens/home_page.dart';

class AppRouter {
  static const HOME_PATH = '/';
  static const LOGIN_PATH = '/login';
  static const POST_PATH = '/post';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_PATH:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case POST_PATH:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
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