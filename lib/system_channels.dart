import 'package:flutter/services.dart';
import 'package:flutter_buried_dot/top_common_function.dart';

// systemChannels:[https://api.flutter.dev/flutter/services/SystemChannels-class.html]

void setupGlobalAppLifecycleListener() {
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

void setupGlobalKeyEventListener() {
  SystemChannels.keyEvent.setMessageHandler((message) async {
    /**
     * {
        "keyCode": 4,
        "character": "\u0000",
        "keymap": "android",
        "plainCodePoint": 0,
        "metaState": 0,
        "flags": 520,
        "source": 257,
        "type": "key-up",
        "deviceId": -1,
        "codePoint": 0,
        "scanCode": 0,
        "repeatCount": 0
        }
     */
    outputToLogcat(message ?? Object(), belongs: "keyEvent");
    return message;
  });
}

void setupNavigationListener() {
  // 可能需要搭配特定组件使用
  // SystemChannels.navigation.setMethodCallHandler((call) async {
  //   var arguments = call.arguments;
  //   var method = call.method;
  //   outputToLogcat(
  //     "argument:$arguments  method:$method",
  //     belongs: "navigationListener",
  //   );
  //   return call;
  // });
}

void setupSystemListener() {
  /// system相关
  /// memoryPressure: Indicates that the operating system would like applications to release caches to free up more memory.
  /// See WidgetsBindingObserver.didHaveMemoryPressure, which triggers whenever a message is received on this channel.
  SystemChannels.system.setMessageHandler((message) async {
    outputToLogcat(message ?? Object(), belongs: "systemListener");
    return message;
  });
}

void setupTextInputListener() {
  /// 输入框相关
  /// TextInputClient.updateEditingState: The user has changed the contents of the text control. The second argument is an object with seven keys, in the form expected by TextEditingValue.fromJSON.
  // TextInputClient.updateEditingStateWithTag: One or more text controls were autofill ed by the platform's autofill service. The first argument (the client ID) is ignored, the second argument is a map of tags to objects in the form expected by TextEditingValue.fromJSON. See AutofillScope.getAutofillClient for details on the interpretation of the tag.
  // TextInputClient.performAction: The user has triggered an action. The second argument is a String consisting of the stringification of one of the values of the TextInputAction enum.
  // TextInputClient.requestExistingInputState: The embedding may have lost its internal state about the current editing client, if there is one. The framework should call and again with its most recent information. If there is no existing state on the framework side, the call should fizzle. (This call is made without a client ID; indeed, without any arguments at all.)TextInput.setClientTextInput.setEditingState
  // TextInputClient.onConnectionClosed: The text input connection closed on the platform side. For example the application is moved to background or used closed the virtual keyboard. This method informs TextInputClient to clear connection and finalize editing. and is not called after clearing the connection since on the platform side the connection is already finalized.TextInput.clearClientTextInput.hide
  SystemChannels.system.setMessageHandler((message) async {
    outputToLogcat(message ?? "Object", belongs: "textInputListener");
    return message;
  });
}

void setupMouseCursorListener() {
  /// 鼠标指针
  /// activateSystemCursor: Request to set the cursor of a pointer device to a system cursor.
  /// The parameters are integer , and string .device-kind
  SystemChannels.mouseCursor.setMethodCallHandler((call) async {
    outputToLogcat(call, belongs: "mouseCursor");
    return call;
  });
}
