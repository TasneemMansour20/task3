import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rock Scissors Paper'),
          backgroundColor: Colors.pink,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftBtn = Random().nextInt(3);
  int rightBtn = Random().nextInt(3);
  String gameResult = '';

  void playGame() {
    int mySelection = leftBtn;
    int systemSelection = rightBtn;

    if ((mySelection == 0 && systemSelection == 2) ||
        (mySelection == 1 && systemSelection == 0) ||
        (mySelection == 2 && systemSelection == 1)) {
      setState(() {
        gameResult = 'You win!';
      });
    } else if ((systemSelection == 0 && mySelection == 2) ||
        (systemSelection == 1 && mySelection == 0) ||
        (systemSelection == 2 && mySelection == 1)) {
      setState(() {
        gameResult = 'System wins!';
      });
    } else {
      setState(() {
        gameResult = 'No one wins';
      });
    }
  }

  void randMe() {
    setState(() {
      leftBtn = Random().nextInt(3);
      rightBtn = Random().nextInt(3);
      gameResult = '';
      playGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextButton(
                  child: Column(
                    children: [
                      Image.asset("images/btn$leftBtn.png"),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Me",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      ),
                    ],
                  ),
                  onPressed: randMe,
                ),
              ),
              Text(
                "VS",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Column(
                    children: [
                      Image.asset("images/btn$rightBtn.png"),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "System",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      ),
                    ],
                  ),
                  onPressed: randMe,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            gameResult,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
