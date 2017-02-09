//An Obstickle. Rockets hit them

class Obstackle {
  PVector topLeft;
  PVector bottomRight;

  Obstackle(float x1, float y1, float x2, float y2) {
    topLeft = new PVector(min(x1, x2), min(y1, y2));
    bottomRight = new PVector(max(x1, x2), max(y1, y2));
  }

  void display() {
    rect(topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);
  }

  boolean contains(Rocket rocket) {
    float x = rocket.location.x;
    float y = rocket.location.y;
    if (x > topLeft.x && x < bottomRight.x && y > topLeft.y && y < bottomRight.y)
      return true;
    return false;
  }
}