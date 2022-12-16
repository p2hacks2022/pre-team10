import 'package:auto_route/auto_route.dart';
import 'package:front/ui/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui/login/login_screen.dart';
import '../ui/thanks/thanks_screen.dart';
import 'auth_guard.dart';
part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainScreen, path: '/', guards: [AuthGuard]),
    AutoRoute<bool>(
      page: LoginScreen,
      path: '/login',
    ),
    AutoRoute(page: ThanksScreen, path: '/thanks/:trash', guards: [AuthGuard]),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter(authGuard: ref.watch(authGuardProvider));
});
