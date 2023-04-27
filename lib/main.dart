import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/domain/route_observer_sample.dart';
import 'package:flutter_buried_dot/domain/system_channels.dart';
import 'package:flutter_buried_dot/navigation/app_routes.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupGlobalAppLifecycleListener();
  setupGlobalKeyEventListener();
  setupNavigationListener();
  setupSystemListener();
  setupTextInputListener();
  setupMouseCursorListener();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [
        RouteObserverSample(),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
      routingCallback: (value) {
        /**value 如下:
         * data class Routing(
         *    val current:String,
         *    val previous:String,
         *    val args:Any,
         *    val removed:String,
         *    val route:Route?,
         *    val isBack:Boolean,
         *    val isBottomSheet:Boolean,
         *    val isDialog:Boolean,
         * )
         */
      },
    );
  }
}
