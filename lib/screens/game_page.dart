
import 'package:flutter/material.dart';
import '../layouts/mobile.dart';
import '../layouts/web.dart';
import 'game_grid_ui.dart';
import 'game_utils.dart';

import 'package:tic_tac_toe/computer/computer.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<int> board;
  late int currentPlayer;
  late final GameUtils _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = GameUtils(_movePlayed, _onGameEnd);
    _initializeGame();
  }

  void _initializeGame() {
    currentPlayer = Comp.HUMAN;
    board = List.generate(9, (idx) => Comp.EMPTY_SPACE);
  }

  void _onGameEnd(int winner) {
    String title = "Game over!";
    String content = "You lose :(";
    switch (winner) {
      case Comp.HUMAN:
        title = "Congratulations!";
        content = "You managed to beat an unbeatable AI!";
        break;
      case Comp.AI_PLAYER:
        title = "Game Over!";
        content = "You lose :(";
        break;
      default:
        title = "Draw!";
        content = "No winners here.";
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _initializeGame();
                  Navigator.of(context).pop();
                });
              },
              child: Text("Restart"),
            )
          ],
        );
      },
    );
  }

  void _movePlayed(int idx) {
    setState(() {
      board[idx] = currentPlayer;

      if (currentPlayer == Comp.HUMAN) {
        currentPlayer = Comp.AI_PLAYER;
        _presenter.onHumanPlayed(board);
      } else {
        currentPlayer = Comp.HUMAN;
      }
    });
  }

  String getSymbolForIdx(int idx) {
    return Comp.SYMBOLS[board[idx]] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return MobileLayoutBuilder(
              child: _buildGameContent(),
            );
          } else {
            return WebLayoutBuilder(
              child: _buildGameContent(),
            );
          }
        },
      ),
    );
  }

  Widget _buildGameContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        Text(
          "You are playing as X",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.all(20),
            children: List.generate(9, (idx) {
              return GameGridUi(
                idx: idx,
                onTap: _movePlayed,
                playerSymbol: getSymbolForIdx(idx),
              );
            }),
          ),
        ),
      ],
    );
  }
}
