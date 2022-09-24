class Player extends Plane {

  public Player() {
    xpos = width/2;
    ypos = height/2;
    life = 3;
    speed = 4;
    angel = radians(0);
    w = 3;
    s = createShape(RECT, 0, 0, 40, 82);
    s.setFill(color(255, 255, 255));
  }

  void run() {
    display();
    borders();
  }

  void borders() {
    if (xpos < -padding) xpos = width+padding;
    if (ypos < -padding) ypos = height+padding;
    if (xpos > width+padding) xpos = -padding;
    if (ypos > height+padding) ypos = -padding;
  }
}
