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
      final args = routeData.argsAs<LoginRouteArgs>();
      return AdaptivePage<bool>(
        routeData: routeData,
        child: LoginScreen(
          key: args.key,
          onResult: args.onResult,
        ),
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
    SlotRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SlotRouteArgs>(
          orElse: () =>
              SlotRouteArgs(encrypted: pathParams.optString('trash')));
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: SlotScreen(
          encrypted: args.encrypted,
          key: args.key,
        ),
      );
    },
    QRRoute.name: (routeData) {
      final args =
          routeData.argsAs<QRRouteArgs>(orElse: () => const QRRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: QRScreen(key: args.key),
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
        RouteConfig(
          SlotRoute.name,
          path: '/slot/:trash',
          guards: [authGuard],
        ),
        RouteConfig(
          QRRoute.name,
          path: '/qr',
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
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    required void Function(bool) onResult,
  }) : super(
          LoginRoute.name,
          path: '/login',
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onResult,
  });

  final Key? key;

  final void Function(bool) onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
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

/// generated route for
/// [SlotScreen]
class SlotRoute extends PageRouteInfo<SlotRouteArgs> {
  SlotRoute({
    String? encrypted,
    Key? key,
  }) : super(
          SlotRoute.name,
          path: '/slot/:trash',
          args: SlotRouteArgs(
            encrypted: encrypted,
            key: key,
          ),
          rawPathParams: {'trash': encrypted},
        );

  static const String name = 'SlotRoute';
}

class SlotRouteArgs {
  const SlotRouteArgs({
    this.encrypted,
    this.key,
  });

  final String? encrypted;

  final Key? key;

  @override
  String toString() {
    return 'SlotRouteArgs{encrypted: $encrypted, key: $key}';
  }
}

/// generated route for
/// [QRScreen]
class QRRoute extends PageRouteInfo<QRRouteArgs> {
  QRRoute({Key? key})
      : super(
          QRRoute.name,
          path: '/qr',
          args: QRRouteArgs(key: key),
        );

  static const String name = 'QRRoute';
}

class QRRouteArgs {
  const QRRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'QRRouteArgs{key: $key}';
  }
}
