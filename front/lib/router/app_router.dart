import 'package:auto_route/auto_route.dart';
import 'package:front/ui/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui/login/login_screen.dart';
import 'auth_guard.dart';
part 'app_router.gr.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainScreen, initial: true, guards: [AuthGuard]),
    AutoRoute<bool>(page: LoginScreen)
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter(authGuard: ref.watch(authGuardProvider));
});
