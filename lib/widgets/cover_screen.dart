import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {
  final bool isGameStarted;
  const CoverScreen({Key? key, required this.isGameStarted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, -0.6),
      child: Text(
        isGameStarted ? "" : "TAP TO PLAY",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
