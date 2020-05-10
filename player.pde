final int POINTS_FOR_COIN = 1; //<>// //<>// //<>// //<>// //<>// //<>//
int playerX;
int playerY;
int playerScore = 0;
boolean key1 = false;
int coinCount = 0;
int life = 0;



void placePlayer(int x, int y) {
  playerX = x;
  playerY = y;
}

void movePlayer(int dx, int dy) {
  int nextX = playerX + dx;
  int nextY = playerY + dy;

  if(currentLevel[nextY][nextX] != '#' && currentLevel[nextY][nextX] != 'D') {
    playerX = nextX;
    playerY = nextY;
  }
  if(currentLevel[nextY][nextX] == 'E' && currentLevelIndex < 2) {
    loadNextLevel();
    coinCount = 0;
    portalSound.play();
    portalSound.rewind();
  }
  else if (currentLevel[nextY][nextX] == 'E' && coinCount >= 10) { 
    loadNextLevel();
    coinCount = 0;
    portalSound.play();
    portalSound.rewind();
  } else if(currentLevel[nextY][nextX] == 'o' || currentLevel[nextY][nextX] == '0' || currentLevel[nextY][nextX] == 'O') {
    playerScore += POINTS_FOR_COIN;  
    if(currentLevel[nextY][nextX] == 'O') {
      currentLevel[nextY][nextX] = 'w';
    } else {
      currentLevel[nextY][nextX] = ' ';
    }
    coinCount++;
    coinSound.play();
    coinSound.rewind(); //<>//
  } else if(currentLevel[nextY][nextX] == '^' || currentLevel[nextY][nextX] == '>') { 
    state = DEATH_STATE;
  } else if(currentLevel[nextY][nextX] == '&' || currentLevel[nextY][nextX] == '$' ) {
    keySound.play();
    keySound.rewind();
    currentLevel[nextY][nextX] = ' ';        
    key1 = true;
  } else if(currentLevel[nextY][nextX] == 'D' && key1 == true) {
    currentLevel[nextY][nextX] = ' ';
    key1 = false;
  } else if(currentLevel[nextY][nextX] == '.') {
    currentLevel[nextY][nextX] = ' ';
  } else if(currentLevel[nextY][nextX] == '_') {
    iceSound.play();
    iceSound.rewind();
    currentLevel[nextY][nextX] = 'w';
  } else if(currentLevel[nextY][nextX] == 'w') {
    state = DEATH_STATE;
  }
}

void drawPlayer() {
  int pixelX = centeringShiftX + playerX * cellSIZE;  
  int pixelY = centeringShiftY + playerY * cellSIZE;


  image(playerImage, pixelX, pixelY, cellSIZE, cellSIZE);
}

void drawPlayerScore() {
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(255);
  text("score: " + playerScore, 100, 40);
}
