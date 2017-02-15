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
      acceleration = dna.genes[x][y];
      velocity.add(acceleration);
      velocity.limit(maxSpeed);
      location.add(velocity);
      if (PVector.dist(location, target) < 20)
        finished = 0;
    }
  }

  void display() {
    if (crushed) 
      fill(94,53,177);
    else if (finished != 100000)
      fill(67,160,71);
    else 
      fill(255);
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading() - HALF_PI);
    beginShape();
    vertex(0, 9);
    vertex(-4, -3);
    vertex(4, -3);
    endShape();
    popMatrix();
    //ellipse(location.x, location.y, 4, 4);
    noFill();
  }

  void fitness() {
    float dist = PVector.dist(location, target);
    if (finished != 100000)
      dist = 1;
    fitness = (1 / pow(finished, 1.5)) * (1 / (pow(dist, 6)));
    if (crushed) 
      fitness *= 0.1;
  }
}