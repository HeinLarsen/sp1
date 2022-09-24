class Player extends Plane {

  public Player() {
    xpos = width/2;
    ypos = height/2 - 100;
    life = 3;
    speed = 5;
    angle = radians(0);
    w = 4;
    loc = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 5;
    padding = 40;
    s = createShape(RECT, 0, 0, 40, 82);
    s.setFill(color(255, 255, 255));
  }

  void run() {
    display();
    borders();
  }

  void borders() {
    if (loc.x < -padding) xpos = loc.x = width+padding;
    if (loc.y < -padding) loc.y = ypos = height+padding;
    if (loc.x > width+padding) loc.x = xpos -padding;
    if (loc.y > height+padding) loc.y = ypos -padding;
  }
}
