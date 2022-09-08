import 'dart:async';
import 'package:controller/model/game_model.dart';

enum direction { UP, DOWN, LEFT, RIGHT }

class MyGame {
  bool gameHasStarted = false;
  double ballX = 0;
  double ballY = 0;
  late Timer _timer;
  double _playerX = -0.2;
  double _brickWidth = 0.6;

  var _ballYDirection = direction.DOWN;
  var _ballXDirection = direction.LEFT;

  StreamController<GameModel> startGameSubject = StreamController<GameModel>();

  void startGame() {
    gameHasStarted = true;
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setDirection();
      moveBall();
      sinkData();
      // check if player dead
      if (isPlayerDead()) {
        reset();
      }
    });
  }

  bool isPlayerDead() {
    if (ballY >= 1) {
      return true;
    }
    return false;
  }

  void sinkData() {
    startGameSubject.sink.add(GameModel(
        ballX: ballX,
        ballY: ballY,
        isGameStarted: gameHasStarted,
        playerX: _playerX,
        //  _playerX,
        playerWidth: _brickWidth,
        enemyX: ballX));
  }

  void setDirection() {
    if (ballY >= 0.89 && _playerX + _brickWidth >= ballX && _playerX <= ballX) {
      _ballYDirection = direction.UP;
    } else if (ballY <= -0.84) {
      _ballYDirection = direction.DOWN;
    }

    // horizontal ball direction
    if (ballX >= 1) {
      _ballXDirection = direction.LEFT;
    } else if (ballX <= -1) {
      _ballXDirection = direction.RIGHT;
    }
  }

  void moveBall() {
    if (_ballYDirection == direction.DOWN) {
      ballY += 0.005;
    } else if (_ballYDirection == direction.UP) {
      ballY -= 0.005;
    }

    // horizonal ball movement

    if (_ballXDirection == direction.LEFT) {
      ballX -= 0.005;
    } else if (_ballXDirection == direction.RIGHT) {
      ballX += 0.005;
    }
  }

  void reset() {
    gameHasStarted = false;
    ballX = 0;
    ballY = 0;
    _playerX = -0.2;
    _ballYDirection = direction.DOWN;
    if (_timer.isActive) {
      _timer.cancel();
    }
    sinkData();
  }

  void moveRightBrick() {
    if (_playerX < 1) {
      _playerX += 0.1;
    } else {
      _playerX = 1;
    }
    sinkData();
  }

  void moveLeftBrick() {
    if (_playerX > -1) {
      _playerX -= 0.1;
    } else {
      _playerX = -1;
    }
    sinkData();
  }

  void dispose() {
    startGameSubject.close();
  }
}
