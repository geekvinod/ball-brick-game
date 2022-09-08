import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  final bool isRightArrow;
  final VoidCallback onTap;
  const Arrow({
    Key? key,
    this.isRightArrow = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey.shade800,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(40),
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.5,
                  blurRadius: 8,
                  color: Colors.white,
                  blurStyle: BlurStyle.solid,
                  offset: Offset(0.4, 0.2))
            ]),
        height: 80,
        width: 80,
        child: Icon(
          isRightArrow ? Icons.arrow_forward : Icons.arrow_back,
          size: 60,
          color: Colors.black,
        ),
      ),
    );
  }
}
