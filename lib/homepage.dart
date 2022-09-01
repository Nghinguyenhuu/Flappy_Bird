import 'dart:async';

import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double birdY = 0;
  double height = 0;
  double time = 0;
  double gravity = -4.9;
  double velocity = 3.5;
  double initialPos = 0;

  bool gamestarted = false;

  void gameStart() {
    gamestarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      height = -gravity * time * time + velocity * time;
      setState(() {
        birdY = initialPos - height;
      });

      if(birdIsDead()){
        timer.cancel();
        gamestarted = false;
      }
      time += 0.01;
    });
  }

  bool birdIsDead() {
    if (birdY < -1 || birdY > 1) {
      return true;
    }
    return false;
  }

  void jump() {
    time = 0;
    initialPos = birdY;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gamestarted ? jump : gameStart,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Stack(
                      children: [
                        MyBird(birdY: birdY),
                        Container(
                          child: Text(
                            gamestarted ? '' : 'T A P  T O  P L A Y',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                child: Container(
              color: Colors.brown,
            ))
          ],
        ),
      ),
    );
  }
}
