//An array of smart rockets. Manages them

class Rockets {

  Rocket[] army;
  int arrivedCounter, crushedCounter;
  float firstDistance;
  PVector first;
  ArrayList<Rocket> matingPool;
  int counter;
  int best;
  PVector start;

  Rockets(int gridScale, int size, PVector start) {
    this.start = start;
    army = new Rocket[size];
    for (int i = 0; i < army.length; i++) {
      army[i] = new Rocket(gridScale, start);
    }
    matingPool = new ArrayList<Rocket>();
    counter = 0;
    best = 0;
    crushedCounter = 0;
  }

  void run(int counter, Obstackles obstackles) {
    while (this.counter < counter) {
      for (int i = 0; i < army.length; i++) {
        army[i].update();//updating army
        if (army[i].finished == 0) //counting best finished ones
          army[i].finished = ++best;
        if (!army[i].crushed && (obstackles.contains(army[i]) || army[i].location.x < 0 || army[i].location.x > width || army[i].location.y < 0 || army[i].location.y > height)) {
          army[i].crushed = true;
          crushedCounter++;
        }
      }
      this.counter++;
    }
    for (int i = 0; i < army.length; i++) {
      army[i].display();
    }
    showInfo();
  }

  void evolve() {
    counter = 0;
    best = 0;
    crushedCounter = 0;
    fitness();
    selection();
    generate(mutationScale);
    matingPool.clear();
  }

  void fitness() {    
    for (int i = 0; i < army.length; i++)
      army[i].fitness();
  }

  void selection() {   
    float bestFitness = getBestFitness(); 
    float averageFitness = getAverageFitness();
    for (int i = 0; i < army.length; i++) {
      if (army[i].fitness > averageFitness) {//adding only the best half
        float n = map(army[i].fitness, 0, bestFitness, 0, 100);
        for (int j = 0; j < n; j++)
          matingPool.add(army[i]);
      }
    }
  }

  void generate(float mutationScale) {
    for (int i = 0; i < army.length; i++) {
      int a = (int)random(matingPool.size());
      int b = (int)random(matingPool.size());
      println(i, a, b, matingPool.size(), getBestFitness());
      army[i] = new Rocket(mutationScale, start, matingPool.get(a), matingPool.get(b));
    }
  }

  float getBestFitness() {
    float max = 0;    
    for (int i = 0; i < army.length; i++) 
      if (army[i].fitness > max) max = army[i].fitness;
    return max;
  }

  float getAverageFitness() {
    float total = 0;    
    for (int i = 0; i < army.length; i++) 
      total += army[i].fitness;
    return total / army.length;
  }

  void showInfo() { 
    text("Rockets crushed: " + crushedCounter, 5, 80);
    text("Rockets arrived: " + best, 5, 100);
  }
}