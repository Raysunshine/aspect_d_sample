import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String tags() =>
    "${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())} Raysunshine";

void outputToLogcat(Object message, {String belongs = ""}) {
  try {
    var belongsPattern = belongs == "" ? "\t" : "$belongs->\t";
    var tagPrefix = "${tags()}\t\t";
    var tagSuffix = jsonEncode(message);
    debugPrint("$tagPrefix$belongsPattern$tagSuffix");
  } catch (exception) {
    debugPrint("Raysunshine  !!!!!!!!!!!捕获到异常  $exception!!!!!!!!!!!!!!!");
  }
}
