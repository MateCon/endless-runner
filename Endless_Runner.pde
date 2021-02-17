import processing.sound.*;
SoundFile ingameMusic, menuMusic, deathSound, movementSound;

PImage ghostIdle[] = {null, null, null, null},
       fireBallMoving[] = {null, null, null, null, null, null, null, null},
       background,
       instructionSprite,
       mainScreenText,
       textScore,
       numberSprites[] = {null, null, null, null, null, null, null, null, null, null};

int screenWidth = 1080, screenHeight = 720;
int backgroundRepeat[] = {((int)screenWidth/128) + 2, ((int)screenHeight/128) + 2};
int backgroundOffset = 0;

ArrayList<SpikeLayer> spikes; 
float spikeSpeed, margin, marginCounter;

int score, gameFrame = 0;

ParticleSystem particleSystem = new ParticleSystem();

Player player;

void setup() {
  size(1080, 720);
  frameRate(30);
  loadAssets();
  
  restart();
  player.hasDied = true;
  menuMusic.loop();
}

void draw() {
  updateBackground();
  updateGame();
  show();
}

void keyPressed() {
  if(key == 'w') player.move(0, -1);
  if(key == 'a') player.move(-1, 0);
  if(key == 's') player.move(0, 1);
  if(key == 'd') player.move(1, 0);
  if(key == 'r' || player.hasDied) {
    ingameMusic.stop();
    menuMusic.stop();
    ingameMusic.loop();
    restart();
    gameFrame = 0;
  }
}
