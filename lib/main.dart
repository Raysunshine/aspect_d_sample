import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/navigation/app_routes.dart';
import 'package:flutter_buried_dot/route_observer_sample.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [RouteObserverSample()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
    );
  }
}
