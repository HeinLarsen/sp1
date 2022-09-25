class Enemy extends Plane {
  boolean flipping = false;
  int timer;
  float easing = 0.05f;
  
  
  public Enemy() {
    life = 3;
    speed = 4;
    angle = radians(0);
    w = 4;
    loc = new PVector(0, 0);
    vel = new PVector(0, 0);
    s = createShape(RECT, 0, 0, 20, 40);
    s.setFill(color(255, 0, 0));
    padding = 50;
  }

  void run() {
    display();
    borders();
    findPlayer();
  }

  void startPos() {
    vel.x = random(padding, width - padding);
    vel.y = random(padding, height - padding);
    loc.x = vel.x;
    loc.y = vel.y;
    //angle = p1.loc.heading();
    //angle = radians(90+90);
  }

  void findPlayer() {
    
    
    //// this works for shooting
    //float c = calcAtan(p1.loc.x, loc.x, p1.loc.y, loc.y);
    //float dir = (c - angle) / TWO_PI;
    //dir -= round(dir);
    //dir *= TWO_PI;
    //println(dir);
    //angle += dir;
  }




  void borders() {
    if (loc.x < padding && !flipping) flip();
    if (loc.y < padding && !flipping) flip();
    if (loc.x > width-padding && !flipping) flip();
    if (loc.y > height-padding && !flipping) flip();
  }

  void flip() {
    flipping = true;

    float c = calcAtan(width/2, loc.x, height/2, loc.y);
    angle = c;

    flipping = false;
  }
}
