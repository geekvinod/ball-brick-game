import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final double? x;
  final double? y;

  const Ball({Key? key, this.x, this.y}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x!, y!),
      child: AvatarGlow(
        endRadius: 50,
        animate: true,
        repeat: true,
        glowColor: Colors.white,
        child: Material(
          elevation: 10,
          shape: CircleBorder(),
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}
