import 'package:flutter/material.dart';
import 'package:front/ini.dart';
import 'package:front/router/app_router.dart';
import 'package:front/router/auth_guard.dart';

void main() async {
  await ini(); //initialize app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter(
    authGuard: AuthGuard(),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
