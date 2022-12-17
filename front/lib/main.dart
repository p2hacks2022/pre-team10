import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/ini.dart';
import 'package:front/router/app_router.dart';
import 'package:front/router/auth_guard.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await appInit(); //initialize app
  await FirebaseAuth.instance.signOut();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  MyApp({super.key});
  final _appRouter = AppRouter(
    authGuard: AuthGuard(),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    providerInit(ref);
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
