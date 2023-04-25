import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/component/custom_split_path_button.dart';
import 'package:flutter_buried_dot/component/rely_on_value_key_button.dart';
import 'package:flutter_buried_dot/ui/home/home_action.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

abstract class Listener extends StatelessWidget {
  const Listener({super.key});
}

class HomeWidget extends Listener {
  const HomeWidget({super.key});

  HomeLogic get controller => Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text("count = ${controller.count.value.toString()}"),
            ),
            Obx(
              () => Visibility(
                visible: controller.companyName.value.isNotEmpty,
                child:
                    Text("接收到参数 : company = ${controller.companyName.value}"),
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () => onAction(HomeActionType.navigateWithArguments),
              child: const Text("携带参数跳转到Profile"),
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                const Text("commonTextInputListener: "),
                Expanded(
                  child: TextField(
                    controller: controller.textEditingController,
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 50),
            CustomSplitPathButton(
              symbol: "自定义截取路径",
              doSomething: () => onAction(HomeActionType.doSomething),
            ),
            RelyOnValueKeyButton(
              key: const ValueKey("HomeWidget/Scaffold/Center/Column/收集信息的按钮"),
              symbol: "自定义key",
              doSomething: () => onAction(HomeActionType.doSomething),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onAction(HomeActionType.plusCountValue),
        child: const Icon(Icons.add),
      ),
    );
  }

  void onAction(HomeActionType homeActionType) =>
      controller.onAction(homeActionType);
}
