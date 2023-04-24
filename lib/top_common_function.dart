import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String tags() =>
    "${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())} Raysunshine";

void outputToLogcat(String message) => debugPrint("${tags()}\t\t$message");
