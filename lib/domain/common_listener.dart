import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/base/top_common_function.dart';

void textEditingControllerListener(
  TextEditingController textEditingController,
) {
  var baseOffset = textEditingController.selection.baseOffset;
  var extentOffset = textEditingController.selection.extentOffset;
  if (baseOffset != extentOffset) {
    var minOffset = min(baseOffset, extentOffset);
    var maxOffset = max(baseOffset, extentOffset);
    outputToLogcat(
      textEditingController.text.substring(minOffset, maxOffset),
      belongs: "选中了文本",
    );
  }
}

/// context.visitAncestorElements((element) {}
/// 是否有方法可以在其中判断Element.Widget是自己定义的。
void outputButtonInfo(BuildContext context, String buryPageSymbol) async {
  context.findAncestorRenderObjectOfType();
  var index = 0;
  var elementTree = <String>[];
  elementTree.add(context.widget.runtimeType.toString());
  context.visitAncestorElements((element) {
    var leaf = element.widget.runtimeType.toString();
    if (index != 1 && !leaf.startsWith("_") && !leaf.contains("<")) {
      elementTree.add(leaf);
    }
    if (leaf == buryPageSymbol) {
      index = 1;
    }
    return true;
  });
  var elementPath = elementTree.toSet().toList().reversed.join("/");
  var eventInfo = EventListener(
    operationType: "onTap",
    elementPath: elementPath,
    currentOs: "Android",
    currentTime: DateTime.now().millisecondsSinceEpoch.toString(),
    currentPage: elementPath.split("/").first,
  );
  outputToLogcat(eventInfo);
}

class EventListener {
  final String operationType;
  final String elementPath;
  final String currentOs;
  final String currentTime;
  final String currentPage;

  EventListener({
    required this.operationType,
    required this.elementPath,
    required this.currentOs,
    required this.currentTime,
    required this.currentPage,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["operationType"] = operationType;
    data["elementPath"] = elementPath;
    data["currentOs"] = currentOs;
    data["currentTime"] = currentTime;
    data["currentPage"] = currentPage;
    return data;
  }
}
