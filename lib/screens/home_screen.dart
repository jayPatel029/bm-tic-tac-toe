
import 'package:flutter/material.dart';
import '../layouts/mobile.dart';
import '../layouts/web.dart';
import 'game_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TicTacToe",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return MobileLayoutBuilder(
              child: _buildHomePageContent(context),
            );
          } else {
            return WebLayoutBuilder(
              child: _buildHomePageContent(context),
            );
          }
        },
      ),
    );
  }

  Widget _buildHomePageContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome to Tic Tac Toe!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GamePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), backgroundColor: Colors.lightBlue,
              textStyle: TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("Start Game", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
