import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_buried_dot/top_common_function.dart';

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
