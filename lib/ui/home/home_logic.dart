import 'package:flutter/cupertino.dart';
import 'package:flutter_buried_dot/commonListener.dart';
import 'package:flutter_buried_dot/data/flutter_group.dart';
import 'package:flutter_buried_dot/navigation/app_routes.dart';
import 'package:flutter_buried_dot/ui/home/home_action.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  var count = 0.obs;
  var companyName = "".obs;
  var textEditingController = TextEditingController();

  @override
  void onInit() {
    count.value++;

    textEditingController.addListener(
      () => textEditingControllerListener(textEditingController),
    );

    super.onInit();
  }

  void onAction(HomeActionType homeActionType) {
    switch (homeActionType) {
      case HomeActionType.navigateWithArguments:
        _navigateToProfile(); // 带参跳转
        break;
      case HomeActionType.plusCountValue:
        _addCount(); // 计数器
        break;
    }
  }

  void _addCount() => count.value++;

  Future<void> _navigateToProfile() async {
    var flutterGroup = FlutterGroup(groupLeader: "bhLin", groupMemberCount: 7);

    var companyNameValue = await Get.toNamed(
      AppRoutes.profile,
      arguments: {
        "Android": "Jetpack Compose",
        "IOS": "Swift UI",
        "flutterGroup": flutterGroup,
      },
    );
    companyName.value = companyNameValue ?? "UnKnown";
  }

  @override
  void onClose() {
    textEditingController.removeListener(
      () => textEditingControllerListener(textEditingController),
    );
    super.onClose();
  }
}
