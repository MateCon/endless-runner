class Player {
  int xPos, yPos, xRail = 0, yRail = 0;
  int currentFrame = 0;
  boolean hasDied = false;
  Player(int xPos, int yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
  }
  
  void move(int xDirection, int yDirection) {
    if(this.xRail + xDirection <= 4 && this.xRail + xDirection >= -1) {
      if(yDirection == 0){
        particleSystem.addParticles(new PVector(this.xPos + xRail * screenHeight/4, this.yPos + this.yRail * screenHeight/4 + 30), 20);
        keyViewerActive(key, 10, screenHeight - 10);
        movementSound.play();
      }
      this.xRail += xDirection;
    }
    if(this.yRail + yDirection <= 1 && this.yRail + yDirection >= -1) {
      if(xDirection == 0) {
        particleSystem.addParticles(new PVector(this.xPos + xRail * screenHeight/4 + 20, this.yPos + this.yRail * screenHeight/4 + 30), 10);
        keyViewerActive(key, 10, screenHeight - 10);
        movementSound.play();
      }
      this.yRail += yDirection;
    }
  }
  
  void die() {
    this.xPos = -500;
    this.yPos = -500;
    this.hasDied = true;
    ingameMusic.stop();
    deathSound.play();
    menuMusic.play();
  }
  
  void show() {
    rectMode(CENTER);
    fill(255);
    noStroke();
    image(ghostIdle[currentFrame], this.xPos + xRail * screenHeight/4, this.yPos + this.yRail * screenHeight/4);
  }
  
  void update() {
    if(!hasDied) {
    this.show();
      if(frameCount % 5 == 0) {
        currentFrame++;
        if(currentFrame == 4) currentFrame = 0;
      }
    }
  }
}
