import 'dart:convert';

import 'package:flutter/material.dart';

class RouteObserverSample<R extends Route<dynamic>> extends NavigatorObserver {
  //route是currentDestination，previousRoute是nextDestination
  @override
  void didPop(Route route, Route? previousRoute) {
    var currentRouteName = route.settings.name;
    var currentRouteArguments = jsonEncode(previousRoute?.settings.arguments);
    var previousRouteName = previousRoute?.settings.name;

    debugPrint(
      "Raysunshine  从$currentRouteName携带着$currentRouteArguments返回$previousRouteName",
    );
    super.didPop(route, previousRoute);
  }

  //previousRoute是currentDestination，route是NextDestination
  @override
  void didPush(Route route, Route? previousRoute) {
    var currentRouteName = route.settings.name;
    var currentRouteArguments = jsonEncode(route.settings.arguments);
    var previousRouteName = previousRoute?.settings.name ?? "desktop";

    debugPrint(
      "Raysunshine  从$previousRouteName携带着$currentRouteArguments进入$currentRouteName",
    );
    super.didPush(route, previousRoute);
  }
}
