import 'package:flutter/material.dart';

class MobileLayoutBuilder extends StatelessWidget {
  final Widget child;

  const MobileLayoutBuilder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return child;
        } else {
          return Center(
            child: SizedBox(
              width: 600,
              child: child,
            ),
          );
        }
      },
    );
  }
}
