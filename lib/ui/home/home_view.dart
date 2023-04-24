import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/ui/home/home_action.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomeWidget extends StatelessWidget {
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
          children: [
            TextButton(
              onPressed: () => onAction(HomeActionType.navigateWithArguments),
              child: const Text("跳转"),
            ),
            Obx(
              () => Text("count = ${controller.count.value.toString()}"),
            ),
            Obx(
              () => Visibility(
                visible: controller.companyName.value.isNotEmpty,
                child: Text("company = ${controller.companyName.value}"),
              ),
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
