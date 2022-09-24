class Enemy extends Plane {
  boolean flipping = false;
  int time;
  public Enemy() {
    life = 3;
    speed = 4;
    angle = radians(0);
    w = 4;
    loc = new PVector(0, 0);
    s = createShape(RECT, 0, 0, 40, 82);


    s.setFill(color(255, 0, 0));
    padding = 50;
  }

  void run() {
    display();
    borders();
  }

  void startPos() {
    loc.x = random(20, width - 20);
    loc.y = random(20, height - 20);
    angle = p1.loc.heading();
  }

  void borders() {
    if (loc.x < padding || loc.x > width-padding) flip();
    else if (loc.y < padding || loc.y > height-padding) flip();
  }

  void flip() {
  }
}
