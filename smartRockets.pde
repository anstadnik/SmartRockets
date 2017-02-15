//The main tab

Obstackles obstackles;
Rockets rockets;
int generationCounter, lifeCounter, lifeDuration, speed, gridScale, amount, iterationNeeded, textCounterLeft, textCounterRight;
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
  background(0, 188, 212);
  textCounterLeft = 1;
  textCounterRight = 1;
  if (!paused)
    lifeCounter += speed;
  fill(216,67,21);
  noStroke();
  ellipse(target.x, target.y, 40, 40);
  if (lifeCounter < lifeDuration) {
    obstackles.display();
    rockets.run(lifeCounter, obstackles);
  } else
  {
    rockets.evolve();
    lifeCounter = 0;
    generationCounter++;
  }
  if (adding){
    fill(240,98,146);
    noStroke();
    rect(mouse.x, mouse.y, mouseX, mouseY);
  }
  showInfo();
}

void setVariables() {
  iterationNeeded = -1;
  generationCounter = 0;
  lifeCounter = 0;
  lifeDuration = 500;
  speed = 1;
  gridScale = 10;
  amount = 1000;
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