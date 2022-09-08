import 'package:flutter/material.dart';

class MyBrick extends StatelessWidget {
  final double? x;
  final double? y;
  final double? brickWidth;
  final bool isBrickEnnemy;

  const MyBrick(
      {Key? key, this.x, this.y, this.brickWidth, this.isBrickEnnemy = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * x! + brickWidth!) / (2 - brickWidth!), y!),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 20,
          color: isBrickEnnemy ? Colors.blueGrey.shade200 : Colors.white,
          width: MediaQuery.of(context).size.width / 5,
        ),
      ),
    );
  }
}
