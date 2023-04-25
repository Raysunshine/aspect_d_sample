import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/domain/common_listener.dart';
import 'package:flutter_buried_dot/domain/page_lifecycle_mixin.dart';
import 'package:flutter_buried_dot/navigation/app_routes.dart';
import 'package:flutter_buried_dot/ui/profile/profile_action.dart';
import 'package:get/get.dart';

class ProfileLogic extends GetXControllerWithListener {
  var textEditingController = TextEditingController();

  @override
  onInit() {
    textEditingController.addListener(
      () => textEditingControllerListener(textEditingController),
    );
    super.onInit();
  }

  onAction(ProfileActionType profileActionType) {
    switch (profileActionType) {
      case ProfileActionType.navigateUpWithoutAnything:
        _navigateUpWithoutAnything();
        break;
      case ProfileActionType.navigateUpWithArguments:
        _navigateUpWithArguments();
        break;
      case ProfileActionType.navigateToMessage:
        _navigateToProfile();
        break;
    }
  }

  void _navigateUpWithoutAnything() => Get.back();

  void _navigateUpWithArguments() {
    var companyName = "南京先维";
    Get.back<String>(result: companyName);
  }

  void _navigateToProfile() => Get.offNamedUntil(
        AppRoutes.message,
        (route) => true,
      );

  @override
  void onClose() {
    textEditingController.removeListener(
      () => textEditingControllerListener(textEditingController),
    );
    super.onClose();
  }
}
