import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/base/top_common_function.dart';

class CustomSplitPathButton extends StatelessWidget {
  const CustomSplitPathButton({
    super.key,
    required this.symbol,
    required this.doSomething,
  });

  final String symbol;
  final Function() doSomething;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        outputButtonInfo(context);
        doSomething.call();
      },
      child: Text(symbol),
    );
  }

  /// context.visitAncestorElements((element) {}
  /// 是否有方法可以在其中判断Element.Widget是自己定义的。
  void outputButtonInfo(BuildContext context) {
    var index = 0;
    var elementTree = <String>[];
    elementTree.add(context.widget.runtimeType.toString());
    context.visitAncestorElements((element) {
      var leaf = element.widget.runtimeType.toString();
      index++;
      if (index <= 2) {
        elementTree.add(leaf);
      } else {
        if (element.widget is Scaffold) {
          elementTree.add(leaf);
          index = 9990;
        }
        if (index == 10000) {
          elementTree.add(leaf);
        }
      }
      return true;
    });
    var elementPath = elementTree.toSet().toList().reversed.join("/");
    outputToLogcat(elementPath);
  }
}
