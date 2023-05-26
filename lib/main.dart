import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Rock Scissors Paper game'),
          backgroundColor: Colors.pink,
        ),
        body: dicePage(),
      ),
    ),
  );
}

class dicePage extends StatefulWidget {
  @override
  State<dicePage> createState() => _dicePageState();
}

class _dicePageState extends State<dicePage> {
  int lefbtn = Random().nextInt(3);
  int rightbtn = Random().nextInt(3);

  void randMe() {
    setState(() {
      lefbtn = Random().nextInt(3);
      rightbtn = Random().nextInt(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              child: Column(
                children: [
                  Image.asset("images/btn$lefbtn.png"),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Me",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              onPressed: randMe,
            ),
          ),
          Column(
            children: [
              Text(
                "VS",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          TextButton(
            child: Expanded(
              child: Column(
                children: [
                  Image.asset("images/btn$rightbtn.png"),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Phone",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            onPressed: randMe,
          ),
        ],
      ),
    );
  }
}
