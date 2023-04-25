import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/base/top_common_function.dart';

class RelyOnValueKeyButton extends StatelessWidget {
  const RelyOnValueKeyButton({
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

  void outputButtonInfo(BuildContext context) {
    var keyInfo = (context.widget.key as ValueKey).value;
    outputToLogcat(keyInfo);
  }
}
