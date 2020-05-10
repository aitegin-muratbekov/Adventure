final int MENU_STATE    = 1;
final int GAME_STATE    = 2;
final int PAUSE_STATE   = 3;
final int VICTORY_STATE = 4;
final int DEATH_STATE   = 5;

int state = MENU_STATE;


void setup() {
  fullScreen();
  background(0);
  
  loadFonts();
  loadSounds();
  loadImages();
}

void draw() {  
  background(0);
  frameRate(60);
  
  switch (state) {
    case MENU_STATE:
      winSound.rewind();
      menuSound.play();
      drawMenu();
      break;
    case GAME_STATE:
      winSound.rewind();
      menuSound.rewind();
      gameSound.play();
      drawGame();
      break;
    case PAUSE_STATE:
      winSound.rewind();      
      menuSound.rewind();
      gameSound.rewind();
      drawPause();
      break;
    case DEATH_STATE:
      winSound.rewind();
      menuSound.rewind();
      deathSound.play();
      drawDeath();
      break;
    case VICTORY_STATE:
      winSound.play();
      menuSound.rewind();
      drawVictory();
      break;
  }     
}
void drawMenu() {
  image(menuImage, 0, 0, width, height);
  
  fill(0xFF48B9E0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Adventure", width / 2, height / 2 - 200);
  
  fill(255);
  textSize(20);
  text("Press Enter to start the game", width / 2, height / 2 + 200);
}

void drawGame() { 
  drawLevel();
  drawPlayer(); 
  drawPlayerScore();
}

void drawPause() {
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(200);
  text("Pause", width / 2, height / 2);
  textSize(50);
  text("Press 'p' to contine the game", width / 2, height / 2 + 200);
  text("Press ESC to go back in the menu", width / 2, height / 2 + 250);
}

void drawVictory() {
  fill(255, 0, 0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("You Won!", width / 2, height / 2 - 200);
  
  textSize(70);
  fill(255, 255, 0);
  text("Your Score " + playerScore, width / 2, height / 2 + 100);
  
  fill(255);
  textSize(20);
  text("Press E to go back in the menu", width / 2, height / 2 + 200);
}

void drawDeath() {
  background(0);
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(200);
  text("DEATH", width / 2, height / 2);
  textSize(50);
  text("Press ESC to enter the menu ", width / 2, height / 2 + 200); 
}

void keyPressed() {
  switch (state) {
    case MENU_STATE:
      keyPressedInMenu();
      break;
    case GAME_STATE:
      keyPressedInGame();
      break;
    case PAUSE_STATE:
      keyPressedOnPause();
      break;
    case DEATH_STATE:
      keyPressedInDeath();
      break;
    case VICTORY_STATE:
      keyPressedOnVictory();
      break;
  }     
}
void keyPressedInMenu() {
  if (keyCode == ENTER) {
    state = GAME_STATE;
    playerScore = 0;
    currentLevelIndex = -1;  
    loadNextLevel();    
  }
}

void keyPressedOnPause() {
  if(key == 'P' || key == 'p') {
    state = GAME_STATE;   
  } else if(keyCode == ESC) {
    key = 0;
    state = MENU_STATE;
    menuSound.play();
    menuSound.rewind();
  }
}

void keyPressedOnVictory() {
  if(keyCode == ESC) {
    key = 0;
    state = MENU_STATE;
  } 
}

void keyPressedInDeath() {
  if(keyCode == ESC) {
    key = 0;
    state = MENU_STATE;
  } 
}

void keyPressedInGame() {
  switch (keyCode) {
    case UP:
      movePlayer(0, -1);
      playerImage = loadImage("playerUP.png");
      break;
    case DOWN:
      movePlayer(0, 1);
      playerImage = loadImage("player.png");
      break;
    case LEFT:
      movePlayer(-1, 0);
      playerImage = loadImage("playerL.png");
      break;
    case RIGHT:
      movePlayer(1, 0);
      playerImage = loadImage("playerR.png");
      break;
    case 'p':
    case 'P':
      state = PAUSE_STATE;
      break;
  }
}
