import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/ui/profile/profile_action.dart';
import 'package:get/get.dart';

import 'profile_logic.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  ProfileLogic get controller => Get.find<ProfileLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () =>
                  onAction(ProfileActionType.navigateUpWithoutAnything),
              child: const Text("空参返回"),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () =>
                  onAction(ProfileActionType.navigateUpWithArguments),
              child: const Text("有参返回"),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () => onAction(ProfileActionType.navigateToMessage),
              child: const Text("跳转到Message页面"),
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
          ],
        ),
      ),
    );
  }

  void onAction(ProfileActionType profileActionType) =>
      controller.onAction(profileActionType);
}
