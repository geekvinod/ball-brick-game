import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/home/home.dart';

void main() {
  // await Flame.device.setOrientation(DeviceOrientation.landscapeLeft);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Demo',
      home: HomePage(),
    );
  }
}
