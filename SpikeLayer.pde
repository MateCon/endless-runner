class SpikeLayer {
  int xPos, currentFrame = (int)random(0, 7), frameSpeed = (int)random(4, 6), empty = (int)random(-2, 2);
  float speed, slowSpeed = 0;
  boolean canAddToScore = true;
  SpikeLayer(int xPos, float speed) {
    this.xPos = xPos;
    this.speed = speed;
  }
  
  void kill() {
    //if(!player.hasDied && player.yRail != this.empty && player.xPos + player.xRail * screenHeight/4 >= this.xPos -40 && player.xPos + player.xRail * screenHeight/4 <= this.xPos + 70){
    //  player.die();
    //}
    /*
    !player.hasDied
    player.yRail != this.empty
    player.xPos + player.xRail * screenHeight/4 >= this.xPos -40
    player.xPos + player.xRail * screenHeight/4 <= this.xPos + 70
    */
    if(!player.hasDied && player.yRail != this.empty && player.xPos + player.xRail * screenHeight/4 >= this.xPos -40 && player.xPos + player.xRail * screenHeight/4 <= this.xPos + 70){
      player.die();
    }
  }
  
  void show() {
    rectMode(CENTER);
    noStroke();
    for(int i = -1; i <= 1; i++){
      if(i != empty) image(fireBallMoving[currentFrame], this.xPos, screenHeight/2 + i * screenHeight/4);
    }
  }
  
  void update() {
    if(this.slowSpeed == 0) this.xPos -= this.speed;
    else this.xPos -= this.slowSpeed;
    this.kill();
    this.show();
    if(frameCount % frameSpeed == 0) {
      currentFrame++;
      if(currentFrame == 8) currentFrame = 0;
    }
  }
}

void updateSpikes() {
  for(SpikeLayer spikeLayer : spikes) {
      spikeLayer.update();
  }
  if(spikes.size() > 0 && spikes.get(0).xPos < -128) {
    removeFirstSpikeLayer();
  }
  if(marginCounter <= 0 && !(gameFrame >= 2400 && gameFrame <= 3030)) {
    addSpikeLayer();
  }
  slowPart();
}

void removeFirstSpikeLayer() {
  spikes.remove(0);
}

void addSpikeLayer() {
  spikes.add(new SpikeLayer(screenWidth + 128, spikeSpeed));
  if(margin > screenWidth/4) margin *= 0.95;
  marginCounter = margin;
  if(spikeSpeed < 20) {
    spikeSpeed *= 1.015;
  }
}

void slowPart() {
  if(gameFrame >= 2400 && gameFrame <= 3030) {
    for(SpikeLayer spikeLayer : spikes) {
      spikeLayer.slowSpeed = 1;
    }
  } else {
    for(SpikeLayer spikeLayer : spikes) {
      spikeLayer.slowSpeed = 0;
    }
  }
}
