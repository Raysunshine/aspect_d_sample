import 'package:flutter/services.dart';
import 'package:flutter_buried_dot/top_common_function.dart';

void setupGlobalAppLifecycle() {
  SystemChannels.lifecycle.setMessageHandler((message) async {
    if (message == "AppLifecycleState.resumed") {
      outputToLogcat("进入前台");
    } else if (message == "AppLifecycleState.inactive") {
      outputToLogcat("非活跃状态，不接受交互");
    } else if (message == "AppLifecycleState.paused") {
      outputToLogcat("切换到后台");
    } else if (message == "AppLifecycleState.detached") {
      outputToLogcat("销毁、退出状态");
    } else {
      outputToLogcat("!!!!!!!!!!!!!!!获取到其他状态 -> $message!!!!!!!!!!!!!!!!!");
    }
    return message;
  });
}
