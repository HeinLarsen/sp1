class Player extends Plane {

  public Player() {
    life = 3;
    speed = 7;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dir = new PVector(0, 0);
    padding = 40;
    pl = loadImage("spitfire.png");
    s = createShape(RECT, 0, 0, 20, 40);
    s.setFill(false);
    s.setStroke(false);
  }

  void run() {
    dir = new PVector(mouseX, mouseY);
    movement();
    borders();
    hitDetection();
    display();
  }

  void borders() {
    if (loc.x < -padding) loc.x = width+padding;
    if (loc.y < -padding) loc.y = height+padding;
    if (loc.x > width+padding) loc.x = -padding;
    if (loc.y > height+padding) loc.y = -padding;
  }
}
