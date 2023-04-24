import 'package:flutter_buried_dot/data/flutter_group.dart';
import 'package:flutter_buried_dot/navigation/app_routes.dart';
import 'package:flutter_buried_dot/ui/home/home_action.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  var count = 0.obs;
  var companyName = "".obs;

  @override
  void onInit() {
    count.value++;

    super.onInit();
  }

  void onAction(HomeActionType homeActionType) {
    switch (homeActionType) {
      case HomeActionType.navigateWithArguments:
        navigateToProfile(); // 带参跳转
        break;
      case HomeActionType.plusCountValue:
        addCount(); // 计数器
        break;
    }
  }

  void addCount() => count.value++;

  void navigateToProfile() {
    var flutterGroup = FlutterGroup(groupLeader: "bhLin", groupMemberCount: 7);

    Get.toNamed(
      AppRoutes.profile,
      arguments: {
        "Android": "Jetpack Compose",
        "IOS": "Swift UI",
        "flutterGroup": flutterGroup,
      },
    );
  }
}
