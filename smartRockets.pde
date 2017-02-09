//The main tab

Obstackles obstackles;
Rockets rockets;
int generationCounter, lifeCounter, lifeDuration, speed, gridScale, amount;
float mutationScale;
boolean paused, adding;
PVector mouse;
PVector start;
PVector target;


void setup() {
  size(700, 800);
  setVariables();
}

void draw() {
  background(50);
  lifeCounter += speed;
  ellipse(target.x, target.y, 40, 40);
  if (!paused)
    if (lifeCounter < lifeDuration) {
      obstackles.display();
      rockets.run(lifeCounter, obstackles);
    } else
    {
      rockets.evolve();
      lifeCounter = 0;
    }
  showInfo();
}

void showInfo() {
  textSize(15);
  text("Generation: " + generationCounter, 5, 20);
  text("Cycles left : " + lifeCounter + "/" + lifeDuration, 5, 40);  
  text("Framerate : " + (int)frameRate, 5, 60);
}


void setVariables() {
  generationCounter = 0;
  lifeCounter = 0;
  lifeDuration = 100;
  speed = 1;
  gridScale = 10;
  amount = 1000;
  paused = false;
  adding = false;
  mutationScale = 0.02;
  rectMode(CORNERS);
  start = new PVector(width / 2, height - 20);
  rockets = new Rockets(gridScale, amount, start);
  obstackles = new Obstackles();
  target = new PVector(width / 2, 20);
}

void keyPressed() {
  if (key == 'p')
    paused = !paused;
}

void mousePressed() {
  if (mouseButton == LEFT) {
    adding = true;
    mouse = new PVector(mouseX, mouseY);
  } else if (mouseButton == RIGHT)
    target.set(mouseX, mouseY);
}

void mouseDragged() {
  if (adding);
  rect(mouse.x, mouse.y, mouseX, mouseY);
}

void mouseReleased() {
  if (adding) {
    obstackles.addObstackle(mouse.x, mouse.y, mouseX, mouseY);
    adding = false;
  }
}