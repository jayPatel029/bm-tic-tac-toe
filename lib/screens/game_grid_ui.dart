
import 'package:flutter/material.dart';

class GameGridUi extends StatelessWidget {
  final int idx;
  final Function(int idx) onTap;
  final String? playerSymbol;

  GameGridUi({required this.idx, required this.onTap, this.playerSymbol});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth <= 600 ? 30.0 : 50.0;

        return GestureDetector(
          onTap: () {
            if (playerSymbol == null || playerSymbol!.isEmpty) {
              onTap(idx);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.shade100,
                  Colors.blue.shade200,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Text(
                playerSymbol ?? '',
                style: TextStyle(fontSize: fontSize, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
