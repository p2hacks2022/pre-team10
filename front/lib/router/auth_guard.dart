import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (FirebaseAuth.instance.currentUser != null) {
      // if user is authenticated we continue
      logger.i('User is authenticated');
      logger.i(FirebaseAuth.instance.currentUser?.displayName);
      resolver.next(true);
    } else {
      logger.i('User is not authenticated');
      final flag = await router.push<bool>(LoginRoute(
        onResult: (p0) {
          logger.i('LoginRoute returned $p0');
          resolver.next(p0);
        },
      ));
    }
  }
}

final authGuardProvider = Provider<AuthGuard>((ref) {
  return AuthGuard();
});
