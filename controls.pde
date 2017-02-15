void keyPressed() {
  if (key == 'p')
    paused = !paused;
  if (key == 's' && !standartObsAdded) {
    standartObsAdded = true;
    obstackles.addObstackle(0, 200, 170, 220);
    obstackles.addObstackle(230, 200, width, 220);
    obstackles.addObstackle(0, 400, 320, 420);
    obstackles.addObstackle(380, 400, width, 420);
    obstackles.addObstackle(0, 600, 470, 620);
    obstackles.addObstackle(530, 600, width, 620);
  } 
  if (key == 'r')
    setup();    
  if (key == 'i')
    if (speed < 10) speed++;
  if (key == 'd')
    if (speed > 1) speed--;
}

void mousePressed() {
  if (mouseButton == LEFT) {
    adding = true;
    mouse = new PVector(mouseX, mouseY);
  } else if (mouseButton == RIGHT)
    target.set(mouseX, mouseY);
}

void mouseReleased() {
  if (adding) {    
    obstackles.addObstackle(mouse.x, mouse.y, mouseX, mouseY);
    adding = false;
  }
}

void showInfo() {
  textSize(15);
  noStroke();
  fill(255);
  text("Generation: " + generationCounter, 5, textCounterLeft++ * 20);
  text("Cycles left : " + (lifeDuration - lifeCounter) + "/" + lifeDuration, 5, textCounterLeft++ * 20);  
  text("Framerate : " + (int)frameRate, 5, textCounterLeft++ * 20);  
  text("Speed : " + speed, 5, textCounterLeft++ * 20);  
  if (iterationNeeded != -1)
    text("Nailed it in " + (int)iterationNeeded + " generations", 5, textCounterLeft++ * 20);  
  textAlign(RIGHT);
  if (!standartObsAdded)
    text("Press 's' to add standart obstackles", width - 5, textCounterRight++ * 20);
  text("Press 'r' to restart", width - 5, textCounterRight++ * 20);  
  text("Press 'i' to increase speed", width - 5, textCounterRight++ * 20);
  text("Press 'd' to decrease speed", width - 5, textCounterRight++ * 20);  
  text("Press left mouse button to make an obstackle", width - 5, textCounterRight++ * 20);
  text("Press right mouse button to move the target", width - 5, textCounterRight++ * 20);
  if (paused) 
    text("Press 'p' to run", width - 5, textCounterRight++ * 20);
  textAlign(LEFT);
}