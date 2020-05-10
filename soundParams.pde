import ddf.minim.*;

Minim minim;
AudioPlayer coinSound;
AudioPlayer portalSound;
AudioPlayer deathSound;
AudioPlayer menuSound;
AudioPlayer winSound;
AudioPlayer gameSound;
AudioPlayer keySound;
AudioPlayer iceSound;

void loadSounds() {
  minim = new Minim(this);
  coinSound = minim.loadFile("coin.wav");
  portalSound = minim.loadFile("portal.wav");
  deathSound = minim.loadFile("death.wav");
  keySound = minim.loadFile("key.wav");
  menuSound = minim.loadFile("menu.wav");
  winSound = minim.loadFile("win.wav");
  gameSound = minim.loadFile("game.wav");
  iceSound = minim.loadFile("ice.wav");
}
