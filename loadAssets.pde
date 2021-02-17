void loadAssets() {
  loadGraphics();
  loadSound();
}

void loadGraphics() {
  ghostIdle[0] = loadImage("fantasmita-0001.png");
  ghostIdle[1] = loadImage("fantasmita-0002.png");
  ghostIdle[2] = loadImage("fantasmita-0003.png");
  ghostIdle[3] = loadImage("fantasmita-0004.png");
  
  fireBallMoving[0] = loadImage("blueFireball-0001.png");
  fireBallMoving[1] = loadImage("blueFireball-0002.png");
  fireBallMoving[2] = loadImage("blueFireball-0003.png");
  fireBallMoving[3] = loadImage("blueFireball-0004.png");
  fireBallMoving[4] = loadImage("blueFireball-0005.png");
  fireBallMoving[5] = loadImage("blueFireball-0006.png");
  fireBallMoving[6] = loadImage("blueFireball-0007.png");
  fireBallMoving[7] = loadImage("blueFireball-0008.png");
  
  numberSprites[0] = loadImage("0.png");
  numberSprites[1] = loadImage("1.png");
  numberSprites[2] = loadImage("2.png");
  numberSprites[3] = loadImage("3.png");
  numberSprites[4] = loadImage("4.png");
  numberSprites[5] = loadImage("5.png");
  numberSprites[6] = loadImage("6.png");
  numberSprites[7] = loadImage("7.png");
  numberSprites[8] = loadImage("8.png");
  numberSprites[9] = loadImage("9.png");
  
  background = loadImage("fondo-0001.png");
  instructionSprite = loadImage("instructionSprite-0001.png");
  mainScreenText = loadImage("mainScreenText-0001.png");
  textScore = loadImage("textScore.png");
}

void loadSound() {
  ingameMusic = new SoundFile(this, "SpaceGhost.mp3");
  menuMusic = new SoundFile(this, "introSpaceGhost.mp3");
  deathSound = new SoundFile(this, "deathSound.mp3");
  movementSound = new SoundFile(this, "movementSound.mp3");
}
