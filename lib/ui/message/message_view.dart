import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/ui/message/message_action.dart';
import 'package:get/get.dart';

import 'message_logic.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key});

  MessageLogic get controller => Get.find<MessageLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: const [
          Center(child: Text("count = 1")),
        ],
      ),
    );
  }

  onAction(MessageActionType messageActionType) =>
      controller.onAction(messageActionType);
}