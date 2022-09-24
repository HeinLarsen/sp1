class Enemy extends Plane {
  boolean flip = false;

  public Enemy() {
    xpos = width/2;
    ypos = height/2;
    life = 3;
    speed = 5;
    angel = radians(0);
    w = 7;
    s = createShape(RECT, 0, 0, 40, 82);
    s.setFill(color(255, 0, 0));
  }

  void run() {
    display();
    borders();
  }

  void startPos() {
    xpos = random(width);
    ypos = random(height);
    angel = radians(random(360));
  }

  void borders() {
    if (xpos < padding && !flip) flip();
    if (ypos < padding && !flip) flip();
    if (xpos > width-padding && !flip) flip();
    if (ypos > height-padding && !flip) flip();
  }

  void flip() {
    flip = true;
    float xCenter = width/2;
    float yCenter = height/2;

    float c = cos(yCenter - ypos);
    float s = sin(xCenter - xpos);

    if (c > s) {
      while (c != angel) {
        left();
      }
    } else {
      while (s != angel) {
        right();
      }
    }
  }
}
