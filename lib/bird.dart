import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyBird extends StatelessWidget {
  final double birdY;
  const MyBird({Key? key, required this.birdY}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, birdY),
      height: 50,
      width: 50,
      child: Image.asset('assets/images/Flappy_bird.jpg'),
    );
  }
}
