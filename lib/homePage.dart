// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, dead_code

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage cross = AssetImage('assets/images/cross.png');
  AssetImage circle = AssetImage('assets/images/circle.png');
  AssetImage edit = AssetImage('assets/images/edit.png');
  bool isCross = true;
  var message = "";
  List<String> gameState = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      /*this.*/ gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      /*this.*/ message = "";
    });
  }

  playGame(int index) {
    if (gameState[index] == 'empty') {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
        } else {
          gameState[index] = 'circle';
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  resetGame() {
    setState(() {
      /*this.*/ gameState = [
        "empty"
            "empty"
            "empty"
            "empty"
            "empty"
            "empty"
            "empty"
            "empty"
            "empty"
            "empty"
      ];
      /*this.*/ message = "";
    });
  }

  getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
        defalut:
        {
          return cross;
          break;
        }
    }
  }

  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        message = '${this.gameState[0]} Wins!';
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        message = "${this.gameState[3]} Wins!";
      });
    } else if ((gameState[6] != 'empty' &&
        gameState[6] == gameState[7] &&
        gameState[7] == gameState[8])) {
      setState(() {
        message = "${this.gameState[6]} Wins!";
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        gameState[4] == gameState[8]) {
      setState(() {
        message = "${this.gameState[0]} Wins!";
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        message = "${this.gameState[3]} Wins!";
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        message = "${this.gameState[3]} Wins!";
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        message = "${this.gameState[4]} Wins!";
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        message = "${this.gameState[3]} Wins!";
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = "Game draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Tic-Tac-Toe',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 9,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    playGame(i);
                  },
                  child: Image(
                    image: getImage(gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Text(
            message,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          MaterialButton(
            onPressed: () {
              resetGame();
            },
            color: Colors.amber,
            child: Text('Reset Game.'),
          )
        ],
      ),
    );
  }
}
