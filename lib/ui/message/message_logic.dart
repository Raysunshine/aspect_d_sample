import 'package:flutter_buried_dot/navigation/app_routes.dart';
import 'package:flutter_buried_dot/ui/message/message_action.dart';
import 'package:get/get.dart';

class MessageLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void onAction(MessageActionType messageActionType) {
    switch (messageActionType) {
      case MessageActionType.navigateToRootRoute:
        _navigateToRootRoute();
        break;
    }
  }

  void _navigateToRootRoute() =>
      Get.until((route) => route.settings.name == AppRoutes.home);
}
