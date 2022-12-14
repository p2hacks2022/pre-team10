// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: MainScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AdaptivePage<bool>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    ThanksRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ThanksRouteArgs>(
          orElse: () =>
              ThanksRouteArgs(base64TrashModel: pathParams.optString('trash')));
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: ThanksScreen(
          base64TrashModel: args.base64TrashModel,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        RouteConfig(
          ThanksRoute.name,
          path: '/thanks/:trash',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [ThanksScreen]
class ThanksRoute extends PageRouteInfo<ThanksRouteArgs> {
  ThanksRoute({
    String? base64TrashModel,
    Key? key,
  }) : super(
          ThanksRoute.name,
          path: '/thanks/:trash',
          args: ThanksRouteArgs(
            base64TrashModel: base64TrashModel,
            key: key,
          ),
          rawPathParams: {'trash': base64TrashModel},
        );

  static const String name = 'ThanksRoute';
}

class ThanksRouteArgs {
  const ThanksRouteArgs({
    this.base64TrashModel,
    this.key,
  });

  final String? base64TrashModel;

  final Key? key;

  @override
  String toString() {
    return 'ThanksRouteArgs{base64TrashModel: $base64TrashModel, key: $key}';
  }
}
