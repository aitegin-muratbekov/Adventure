final float CELL_SCALE = 1;

int cellSIZE;
int levelPixelHeight;
int levelPixelWidth;
int centeringShiftX;
int centeringShiftY;

PFont mainFont;

PImage wallImage;
PImage portalImage;
PImage doorImage;
Sprite coinSprite;
Sprite snowSprite;
PImage playerImage;
PImage keyImage;
PImage menuImage;
PImage floorImage;
PImage spikesImage;
PImage gunImage;
PImage iceImage;
PImage waterImage;


void recalcdrawingParams() {
  cellSIZE = int(min(width / currentLevelWidth, height / currentLevelHeight) * CELL_SCALE);
  levelPixelHeight = currentLevelHeight * cellSIZE;
  levelPixelWidth = currentLevelWidth * cellSIZE;
  centeringShiftX = (width - levelPixelWidth) / 2;
  centeringShiftY = (height - levelPixelHeight) / 2;
}

void loadFonts() {
  mainFont = createFont("DS-Nova.ttf", 32);
  textFont(mainFont);
}

void loadImages() { 
  iceImage = loadImage("ice.png");
  wallImage = loadImage("wall.png");
  portalImage = loadImage("portal.png");
  coinSprite = new Sprite("coin/coin_", 7, ".png");
  playerImage = loadImage("player.png");
  keyImage = loadImage("key.png");
  menuImage = loadImage("menu.jpg");
  floorImage = loadImage("floor.png");
  spikesImage = loadImage("spikes.png");
  doorImage = loadImage("door.png");
  waterImage = loadImage("water.png");
}

class Sprite {
  PImage[] images;
  int frame;
  
  int skip, _skip;
  int time = -1;
  
  Sprite(String imagePrefix, int count, String extension) {
    this(imagePrefix, count, extension, 3);
  }
  
  Sprite(String imagePrefix, int count, String extension, int skip) {
    images = new PImage[count];

    for (int i = 0; i < count; i++) {
      String fileName = imagePrefix + i + extension;
      images[i] = loadImage(fileName);
    }
    
    this.skip = skip;
    _skip = skip;
  }

  void draw(float x, float y, float width, float height) {
    if (time < 0 || time > 0) {
      _skip--;
      if (_skip < 0) {
        _skip = skip;
        frame = (frame + 1) % images.length;
      }
      if (time > 0) {
        --time;
      }
      
      image(images[frame], x, y, width, height);
    } else {
      image(images[0], x, y, width, height);
    }
  }
}
