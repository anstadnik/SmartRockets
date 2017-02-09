//A smart rocket

class Rocket {

  DNA dna;
  int finished;
  float fitness;
  PVector location;
  PVector velocity;
  PVector acceleration;
  boolean crushed;
  float maxSpeed;

  Rocket(int gridScale, PVector start) {
    dna = new DNA(gridScale);
    finished = 100000;
    location = start.copy();
    velocity = new PVector();
    acceleration = new PVector();    
    crushed = false;
    maxSpeed = 6;
  }

  Rocket(float mutationScale, PVector start, Rocket parentA, Rocket parentB) {
    dna = new DNA(mutationScale, parentA.dna, parentB.dna);
    finished = 100000;
    location = start.copy();
    velocity = new PVector();
    acceleration = new PVector();
    crushed = false;
    maxSpeed = 6;
  }

  void update() {
    if (finished == 100000 && !crushed) {
      int x = (int)location.x / gridScale;
      int y = (int)location.y / gridScale;
      x = constrain(x, 0, dna.genes.length - 1);
      y = constrain(y, 0, dna.genes[0].length - 1);
      acceleration = dna.getPV(x, y);
      velocity.add(acceleration);
      velocity.limit(maxSpeed);
      location.add(velocity);
      if (PVector.dist(location, target) < 2)
        finished = 0;
    }
  }

  void display() {
    fill(255);
    ellipse(location.x, location.y, 4, 4);
    noFill();
  }

  void fitness() {
    float dist = PVector.dist(location, target);
    fitness = pow(1/dist, 2);
    if (crushed) fitness *= 0.01;
  }
}