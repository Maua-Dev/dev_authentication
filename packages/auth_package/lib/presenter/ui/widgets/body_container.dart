import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  final Widget? child;
  const BodyContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: child,
      ),
    );
  }
}
