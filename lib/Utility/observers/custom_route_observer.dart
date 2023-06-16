import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      print('Route Pushed: ' + route.settings.name!);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      print('Route Popped: ' + route.settings.name!);
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      print('Route Removed: ' + route.settings.name!);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) {
      print('Route Replaced: ' + newRoute!.settings.name!);
    }
  }
}
