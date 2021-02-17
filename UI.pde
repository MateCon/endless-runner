// background //

void updateBackground() {
  if(frameCount%2 == 0) backgroundOffset++;
  if(backgroundOffset == 128) backgroundOffset = 0;
  showBackground();
}

void showBackground() {
  for(int x = 0; x < backgroundRepeat[0]; x++){
    for(int y = 0; y < backgroundRepeat[1]; y++){
      image(background, x*background.width - backgroundOffset, y*background.height);
    }
  }
}

// score //

ArrayList<PImage> numberToArrayOfImages(int number) {
  ArrayList<PImage> images = new ArrayList<PImage>();
  String numberS = str(number);
  int len = numberS.length(), buffer;
  
  for(int index = 0; index < len; index++) {
    switch(numberS.charAt(index)) {
     case '0':
       buffer = 0;
       break;
     case '1':
       buffer = 1;
       break;
     case '2':
       buffer = 2;
       break;
     case '3':
       buffer = 3;
       break;
     case '4':
       buffer = 4;
       break;
     case '5':
       buffer = 5;
       break;
     case '6':
       buffer = 6;
       break;
     case '7':
       buffer = 7;
       break;  
     case '8':
       buffer = 8;
       break;  
     case '9':
       buffer = 9;
       break;
     default:
       buffer = 0;
       break;
      }
    images.add(numberSprites[buffer]);
  }
  return images;
}

void showScore() {
  fill(255);
  textSize(16);
  image(textScore, 0, 0);
  
  ArrayList<PImage> images = numberToArrayOfImages(score);
  int index = 0;
  
  for(PImage image : images) {
    int yOffset = 0;
    if(image == numberSprites[0]) yOffset = 4;
    image(image, 60 + index * 11, 10 - yOffset);
    index++;
  }
}

//void updateScore() {
//  if(!player.hasDied) {
//    if(spikes.get(0).xPos <= 232 + (player.xRail * screenHeight/4) && canAddToScore) {
//      score++;
//      canAddToScore = false;
//    }
//  }
//}

void updateScore() {
  if(!player.hasDied) {
    for(SpikeLayer layer : spikes) {
      if(layer.canAddToScore == true && layer.xPos <= player.xPos + (player.xRail * screenHeight/4)) {
        score++;
        layer.canAddToScore = false;
      }
    }
  }
}

// key viewer //

void keyViewer() {
  image(instructionSprite, 10, screenHeight - 10 - instructionSprite.height);
}

void keyViewerActive(char keyName, int xPos, int yPos) {
  fill(50, 255, 50);
  if(keyName == 'w') {
    square(xPos + 3 * 3 + 44 + 25, yPos + 3 * 3 - 44 * 2, 46);
  } else if(keyName == 'a') {
    square(xPos + 3 + 22, yPos - 3 - 22, 46);
  } else if(keyName == 's') {
    square(xPos + 3 * 3 + 44 + 25, yPos - 3 - 22, 46);
  } else if(keyName == 'd') {
    square(xPos + 3 * 5 + 44 * 2 + 28, yPos - 3 - 22, 46);
  }
  keyViewer();
}

// main Screen //

void mainScreen() {
  fill(50, 150);
  rect(screenWidth/2, screenHeight/2, screenWidth, screenHeight);
  
  textSize(36);
  fill(255);
  
  imageMode(CENTER);
  image(mainScreenText, screenWidth/2, screenHeight/3);
  
  imageMode(CORNER);
}
