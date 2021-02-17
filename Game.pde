void updateGame() {
  gameFrame++;
  player.update();
  updateSpikes();
  updateScore();
  particleSystem.update();
  marginCounter -= spikeSpeed;
}

void show() {
  showScore();
  if(player.hasDied) {
    mainScreen();
  }
  keyViewer();
}

void restart() {
  score = 0;
  
  spikeSpeed = 5;
  margin = screenWidth/2;
  marginCounter = margin;
  
  player = new Player(230, height/2);
  spikes = new ArrayList<SpikeLayer>();
  spikes.add(new SpikeLayer(screenWidth + 128, spikeSpeed));
}
