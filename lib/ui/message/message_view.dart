import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        title: Obx(
          () => Text("Profile ${controller.routeTitle.value}"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("123"),
            ),
            TextButton(
              onPressed: () => onAction(MessageActionType.navigateToRootRoute),
              child: const Text("多级返回"),
            ),
            SizedBox(
              height: 400,
              width: 380,
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    var renderObject = context.findRenderObject();
                    var viewport = RenderAbstractViewport.of(renderObject);
                    var listViewSize = viewport.paintBounds.size; //ListView的信息
                    var childrenCounts =
                        (context.widget as SliverFixedExtentList)
                            .delegate
                            .estimatedChildCount; // ListView的child的个数
                    var itemExtent = (context.widget as SliverFixedExtentList)
                        .itemExtent; // ListView的child的个数
                  },
                  child: Container(
                    color: Colors.blue,
                    height: 66,
                    child: Text(index.toString()),
                  ),
                ),
                itemCount: 100,
                itemExtent: 66,
              ),
            )
          ],
        ),
      ),
    );
  }

  onAction(MessageActionType messageActionType) =>
      controller.onAction(messageActionType);
}
