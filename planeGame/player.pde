class Player extends Plane {

  public Player() {
    life = 3;
    speed = 3;
    angle = radians(0);
    w = 4;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0,10);
    padding = 40;
    s = createShape(RECT, 0, 0, 20, 40);
    s.setFill(color(255, 255, 255));
  }

  void run() {
    display();
    borders();
    hitDetection();

  }

  void borders() {
    if (loc.x < -padding) loc.x = width+padding;
    if (loc.y < -padding) loc.y = height+padding;
    if (loc.x > width+padding) loc.x = -padding;
    if (loc.y > height+padding) loc.y = -padding;
  }
}
