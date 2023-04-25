import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/domain/common_listener.dart';

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
}
