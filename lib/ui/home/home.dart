import 'package:controller/widgets/arrow.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:controller/game/game.dart';
import 'package:controller/model/game_model.dart';
import 'package:controller/widgets/ball.dart';
import 'package:controller/widgets/brick.dart';
import 'package:controller/widgets/cover_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyGame _myGame = MyGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(children: [
            GestureDetector(
                onTap: () {
                  if (!_myGame.gameHasStarted) {
                    _myGame.startGame();
                  } else {
                    _myGame.reset();
                  }
                },
                child: Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: StreamBuilder<GameModel>(
                      stream: _myGame.startGameSubject.stream,
                      builder: (context, snapshot) {
                        GameModel? _gameModel;
                        if (snapshot.hasData) {
                          _gameModel = snapshot.data;
                        } else {
                          _gameModel = GameModel();
                        }
                        return Stack(
                          children: [
                            // cover screen
                            CoverScreen(
                              isGameStarted: _gameModel!.isGameStarted,
                            ),
                            //  top brick
                            MyBrick(
                              x: _gameModel.enemyX,
                              y: -0.85,
                              brickWidth: -0.2,
                              isBrickEnnemy: true,
                            ),
                            // bottom brick
                            MyBrick(
                              x: _gameModel.playerX,
                              y: 0.9,
                              brickWidth: _gameModel.playerWidth,
                            ),
                            // ball
                            Ball(x: _gameModel.ballX, y: _gameModel.ballY)
                            // user arrow
                            ,
                            _divider(),
                            _centerCircle(),
                            _rectangleBox(context)
                          ],
                        );
                      }),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Arrow(
                  isRightArrow: false,
                  onTap: () => _myGame.moveLeftBrick(),
                ),
                Arrow(
                  isRightArrow: true,
                  onTap: () => _myGame.moveRightBrick(),
                )
              ],
            )
          ]),
        ));
  }

  Container _divider() {
    return Container(
      alignment: Alignment(0, 0),
      child: Divider(
        color: Colors.white,
        endIndent: 10,
        indent: 10,
        thickness: 1,
      ),
    );
  }

  Container _centerCircle() {
    return Container(
      alignment: Alignment(0, 0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 4, color: Colors.grey.shade500)),
      ),
    );
  }

  Container _rectangleBox(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0.3),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: MediaQuery.of(context).size.height * 0.77,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 4, color: Colors.grey.shade500)),
      ),
    );
  }
}
