//An array of Obstickles. Manages them

class Obstackles {
  ArrayList<Obstackle> obstackles;

  Obstackles() {    
    obstackles = new ArrayList<Obstackle>();
  }

  void display() {
    for (Obstackle obstackle : obstackles)
      obstackle.display();
  }

  void addObstackle(float x1, float y1, float x2, float y2) {
    obstackles.add(new Obstackle(x1, y1, x2, y2));
  }

  boolean contains(Rocket rocket) {
    for (Obstackle obstackle : obstackles)
      if (obstackle.contains(rocket))
        return true;
    return false;
  }
}