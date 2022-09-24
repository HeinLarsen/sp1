class Player extends Plane {

  public Player() {
    life = 3;
    speed = 5;
    angle = radians(0);
    w = 4;
    loc = new PVector(width/2, height/2);
    padding = 40;
    s = createShape(RECT, 0, 0, 40, 82);
    s.setFill(color(255, 255, 255));
  }

  void run() {
    display();
    borders();
  }

  void borders() {
    if (loc.x < -padding) loc.x = width+padding;
    if (loc.y < -padding) loc.y = height+padding;
    if (loc.x > width+padding) loc.x = -padding;
    if (loc.y > height+padding) loc.y = -padding;
  }
}
