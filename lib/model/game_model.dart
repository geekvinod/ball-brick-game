class GameModel {
  double ballX;
  double ballY;
  bool isGameStarted;
  double playerX;
  double playerWidth;
  double enemyX;

  GameModel({
    this.ballX = 0,
    this.ballY = 0,
    this.isGameStarted = false,
    this.playerX = 0,
    this.playerWidth = 0.4,
    this.enemyX = 0,
  });
}
