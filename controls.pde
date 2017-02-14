void keyPressed() {
  if (key == 'p')
    paused = !paused;
  if (key == 's' && !standartObsAdded) {
    standartObsAdded = true;
    obstackles.addObstackle(0, 200, 190, 220);
    obstackles.addObstackle(210, 200, width, 220);
    obstackles.addObstackle(0, 400, 340, 420);
    obstackles.addObstackle(360, 400, width, 420);
    obstackles.addObstackle(0, 600, 490, 620);
    obstackles.addObstackle(510, 600, width, 620);
  }
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
  text("Generation: " + generationCounter, 5, textCounter++ * 20);
  text("Cycles left : " + lifeCounter + "/" + lifeDuration, 5, textCounter++ * 20);  
  text("Framerate : " + (int)frameRate, 5, textCounter++ * 20);  
  if(iterationNeeded != -1)
  text("Nailed it in " + (int)iterationNeeded + " generations", 5, textCounter++ * 20);  
  if (!standartObsAdded)
    text("Press 's' to add standart obstackles", 5, textCounter++ * 20);
  if (paused) {  
    textSize(30);
    text("Press 'p' to run", 20, 150);
  }
}