import 'package:flutter/material.dart';

class WebLayoutBuilder extends StatelessWidget {
  final Widget child;

  const WebLayoutBuilder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: 600,
                  child: child,
                ),
              ),
            ],
          );
        } else {
          return child;
        }
      },
    );
  }
}
