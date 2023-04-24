import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String tags() =>
    "${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())} Raysunshine";

void outputToLogcat(Object message, {String belongs = ""}) => debugPrint(
    "${tags()}\t\t${belongs == "" ? "\t" : "$belongs->\t"}${jsonEncode(message)}");
