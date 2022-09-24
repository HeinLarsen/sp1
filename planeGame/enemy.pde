class Enemy extends Plane {
  boolean flipping = false;
  int time;
  public Enemy() {
    xpos = 0;
    ypos = 0;
    life = 3;
    speed = 4;
    angle = radians(0);
    w = 4;
    loc = new PVector(0, 0);
    velocity = new PVector(0, 0);
    topspeed = 4;
    s = createShape(RECT, 0, 0, 40, 82);
    s.setFill(color(255, 0, 0));
    padding = 50;
  }

  void run() {
    display();
      borders();
    //flip();
  }

  void startPos() {
    loc.x = random(20, width - 20);
    loc.y = random(20, height - 20);
    angle = radians(calcAtan(loc.y, height/2, loc.x, width/2));

    xpos = loc.x + 100;
    ypos = loc.y + 100;

  }

  void borders() {
    if (xpos < padding || xpos > width-padding) flip();
    else if (ypos < padding || ypos > height-padding) flip();
  }

  void flip() {
 
    if (time < millis()) {

      println("flipping");
      time = millis() + 250;
      float c = calcAtan(height/2, ypos, width/2, xpos);
      println(c);

      angle = radians(c);
      //for (int i = 0; i < +c; i++) {
      //  if (c < 0) {
      //    left();
      //  } else {
      //    right();
      //  }
      //}
    }
  }
}
