import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/base/top_common_function.dart';
import 'package:get/get.dart';

mixin PageLifecycle {
  var _pageCreatedTime = 0;
  var stayTime = 0;
  var _currentRouting = "";

  void onCreate() {
    _pageCreatedTime = DateTime.now().millisecondsSinceEpoch;
    _currentRouting = Get.routing.current;
  }

  void onDestroy() {
    stayTime = DateTime.now().millisecondsSinceEpoch - _pageCreatedTime;
    outputToLogcat("停留在$_currentRouting页面${stayTime}ms");
  }
}

/// GetXController必须包含状态， 否则不走
abstract class GetXControllerWithListener extends GetxController
    with PageLifecycle, WidgetsBindingObserver {
  @override
  void onInit() {
    onCreate();
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    onDestroy();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        outputToLogcat("$_currentRouting 进入前台");
        break;
      case AppLifecycleState.inactive:
        outputToLogcat("$_currentRouting 非活跃状态，不接受交互");
        break;
      case AppLifecycleState.paused:
        outputToLogcat("$_currentRouting 切换到后台");
        break;
      case AppLifecycleState.detached:
        outputToLogcat("$_currentRouting 销毁、退出状态");
        break;
    }
  }

  @override
  void didHaveMemoryPressure() {
    outputToLogcat("$_currentRouting 之上做了某些操作导致CPU烧了");
    super.didHaveMemoryPressure();
  }
}
