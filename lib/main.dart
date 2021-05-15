import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/presentation/controller/auth_state.dart';
import 'package:flutter_movie_db/presentation/controller/login_controller.dart';
import 'package:flutter_movie_db/router/app_router.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(Environment.dev);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.LOGIN_PATH,
      onGenerateRoute: AppRouter.generateRoute,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
