int currentLevelIndex = -1;
char[][] currentLevel;
int currentLevelWidth;
int currentLevelHeight;

void loadNextLevel() {
  if(currentLevelIndex >= LEVELS.length - 1) {
    state = VICTORY_STATE;        
    return;
  }
  currentLevelIndex++;
  currentLevelWidth = LEVELS[currentLevelIndex][0].length;
  currentLevelHeight = LEVELS[currentLevelIndex].length;
  currentLevel = new char[currentLevelHeight][currentLevelWidth];
  
  for(int y = 0; y < currentLevelHeight; y++) {
    for(int x = 0; x < currentLevelWidth; x++) {
      char cell = LEVELS[currentLevelIndex][y][x];
      if(cell == 'P') {
        placePlayer(x, y);
      }
      currentLevel[y][x] = cell;
    }
  }
  recalcdrawingParams();
}

void drawLevel() {
  for(int y = 0; y < currentLevelHeight; y++) {
    for(int x = 0; x < currentLevelWidth; x++) {
      int pixelX = centeringShiftX + x * cellSIZE;  
      int pixelY = centeringShiftY + y * cellSIZE;
      char cell = currentLevel[y][x];
      switch(cell) {
        case '#':
        case '0':
        case '.':
        case '>':
        case '$':
          image(floorImage, pixelX, pixelY, cellSIZE, cellSIZE);
          image(wallImage, pixelX, pixelY, cellSIZE, cellSIZE);
          break;          
        case ' ':
        case 'P':  
          image(floorImage, pixelX, pixelY, cellSIZE, cellSIZE);
          break;
        case 'E':
          image(floorImage, pixelX, pixelY, cellSIZE, cellSIZE);
          image(portalImage, pixelX, pixelY, cellSIZE, cellSIZE);
          break;
        case 'o':
          image(floorImage, pixelX, pixelY, cellSIZE, cellSIZE);
          coinSprite.draw(pixelX, pixelY, cellSIZE, cellSIZE);
          break;
        case 'O':
          image(iceImage, pixelX, pixelY, cellSIZE, cellSIZE); 
          coinSprite.draw(pixelX, pixelY, cellSIZE, cellSIZE);
          break;
        case '^':
          image(floorImage, pixelX, pixelY, cellSIZE, cellSIZE);
          image(spikesImage, pixelX, pixelY, cellSIZE, cellSIZE);
          break;
        case '&':
          image(floorImage, pixelX, pixelY, cellSIZE, cellSIZE);
          image(keyImage, pixelX, pixelY, cellSIZE, cellSIZE);
          break; 
        case 'D':
          image(floorImage, pixelX, pixelY, cellSIZE, cellSIZE);
          image(doorImage, pixelX, pixelY, cellSIZE, cellSIZE);
          break;
        case '_':
          image(iceImage, pixelX, pixelY, cellSIZE, cellSIZE); 
          break;
        case 'w':
          image(waterImage, pixelX, pixelY, cellSIZE, cellSIZE); 
          break;
      }
    }
  }
}
