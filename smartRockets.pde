//The main tab

Obstackles obstackles;
Rockets rockets;
int generationCounter, lifeCounter, lifeDuration, speed, gridScale, amount, iterationNeeded, textCounter;
float mutationScale;
boolean paused, adding, standartObsAdded;
PVector mouse;
PVector start;
PVector target;


void setup() {
  size(700, 800, P2D);
  setVariables();
}

void draw() {
  background(50);
  textCounter = 1;
  showInfo();
  if (!paused)
    lifeCounter += speed;
  fill(0);
  ellipse(target.x, target.y, 40, 40);
  noFill();
  if (lifeCounter < lifeDuration) {
    obstackles.display();
    rockets.run(lifeCounter, obstackles);
  } else
  {
    rockets.evolve();
    lifeCounter = 0;
    generationCounter++;
  }
  if (adding)
    rect(mouse.x, mouse.y, mouseX, mouseY);
}

void setVariables() {
  iterationNeeded = -1;
  generationCounter = 0;
  lifeCounter = 0;
  lifeDuration = 300;
  speed = 10;
  gridScale = 10;
  amount = 2000;
  paused = true;
  adding = false;
  standartObsAdded = false;
  mutationScale = 0.02;
  rectMode(CORNERS);
  start = new PVector(width / 2, height - 20);
  rockets = new Rockets(gridScale, amount, start);
  obstackles = new Obstackles();
  target = new PVector(width / 2, 20);
}