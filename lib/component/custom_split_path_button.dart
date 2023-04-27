import 'package:flutter/material.dart';
import 'package:flutter_buried_dot/domain/common_listener.dart';

class CustomSplitPathButton extends StatelessWidget {
  const CustomSplitPathButton({
    super.key,
    required this.symbol,
    required this.doSomething,
    this.buryPageSymbol,
  });

  final String symbol;
  final Function() doSomething;
  final String? buryPageSymbol;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        buryPageSymbol != null
            ? outputButtonInfo(context, buryPageSymbol ?? "")
            : null;
        doSomething.call();
      },
      child: Text(symbol),
    );
  }
}
