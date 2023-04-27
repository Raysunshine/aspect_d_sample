import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/component/custom_split_path_button.dart';
import 'package:flutter_buried_dot/data/flutter_group.dart';
import 'package:flutter_buried_dot/domain/common_listener.dart';
import 'package:flutter_buried_dot/domain/page_lifecycle_mixin.dart';
import 'package:flutter_buried_dot/navigation/app_routes.dart';
import 'package:flutter_buried_dot/ui/home/home_action.dart';
import 'package:get/get.dart';

class HomeLogic extends GetXControllerWithListener {
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
      case HomeActionType.doSomething:
        _addCount(); // 计数器
        break;
      case HomeActionType.showDialog:
        Get.dialog(const DialogPage());
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

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300,
      width: 200,
      child: Center(
        child: CustomSplitPathButton(
          symbol: 'Click',
          doSomething: () {},
        ),
      ),
    );
  }
}
