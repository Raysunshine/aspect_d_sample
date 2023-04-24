import 'package:flutter_buried_dot/ui/profile/profile_action.dart';
import 'package:get/get.dart';

class ProfileLogic extends GetxController {
  @override
  onInit() {
    super.onInit();
  }

  onAction(ProfileActionType profileActionType) {
    switch (profileActionType) {
      case ProfileActionType.navigateUpWithoutAnything:
        navigateUpWithoutAnything();
        break;
      case ProfileActionType.navigateUpWithArguments:
        navigateUpWithArguments();
        break;
    }
  }

  void navigateUpWithoutAnything() => Get.back();

  void navigateUpWithArguments() {
    var companyName = "南京先维";
    Get.back(result: companyName);
  }
}
