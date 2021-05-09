import 'package:flutter/material.dart';
import 'package:flutter_movie_db/di/di.dart';
import 'package:flutter_movie_db/presentation/controller/home_controller.dart';
import 'package:flutter_movie_db/presentation/controller/home_state.dart';
import 'package:flutter_movie_db/presentation/ui/screens/home/home_page.dart';
import 'package:flutter_movie_db/presentation/ui/screens/login/login_page.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class AppRouter {
  static const HOME_PATH = '/';
  static const LOGIN_PATH = '/login';
  static const POST_PATH = '/post';
  static const TEST_PATH = '/test';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_PATH:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case HOME_PATH:
        return MaterialPageRoute(
          builder: (_) => StateNotifierProvider<HomeController, HomeState>(
            create: (_) => getIt.get<HomeController>(),
            builder: (context, child) {
              return HomePage();
            },
          ),
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
