import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RouteObserverSample<R extends Route<dynamic>> extends NavigatorObserver {
  //route是currentDestination，previousRoute是nextDestination
  @override
  void didPop(Route route, Route? previousRoute) {
    var currentRouteName = route.settings.name;
    var previousRouteName = previousRoute?.settings.name;
    // 当前拿不到返回值
    // route.navigator._history._result //即返回值

    debugPrint("${tags()}  从$currentRouteName返回到$previousRouteName");
    super.didPop(route, previousRoute);
  }

  //previousRoute是currentDestination，route是NextDestination
  @override
  void didPush(Route route, Route? previousRoute) {
    var currentRouteName = route.settings.name;
    var currentRouteArguments = jsonEncode(route.settings.arguments);
    var previousRouteName = previousRoute?.settings.name ?? "desktop";

    debugPrint(
        "${tags()} 从$previousRouteName携带着$currentRouteArguments进入$currentRouteName");
    super.didPush(route, previousRoute);
  }

  String tags() =>
      "${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())} Raysunshine";
}
