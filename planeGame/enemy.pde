class Enemy extends Plane {
  boolean flipping = false;
  int timer;
  boolean playerClose = false;
  float d;
  PVector aim;



  public Enemy() {
    life = 3;
    speed = 3;
    angle = radians(0);
    w = 4;
    loc = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dir = new PVector(0, 0);
    s = createShape(RECT, 0, 0, 20, 40);
    s.setFill(color(255, 0, 0));
    padding = 50;
  }

  void run() {
    display();
    borders();
    searchPlayer();

    if (playerClose && timer < millis())
      findPlayer();
    else
      movement();
  }

  void startPos() {
    loc.x = width/2;
    loc.y = height/2 + 400;
  }

  void searchPlayer() {
    d = PVector.dist(p1.loc, loc);
    playerClose = d < 350 ? true : false;
  }

  void findPlayer() {
    if (d > 200 && d < 500) {
      dir = PVector.sub(p1.loc, loc);
      dir.normalize();
      acc = dir;
      vel.add(acc);
      vel.limit(speed);
      loc.add(vel);
    } else if (d > 100 && d < 200) {
      float xHeading = p1.loc.x + cos(p1.dir.heading()) * 100;
      float yHeading = p1.loc.y + sin(p1.dir.heading()) * 100;

      ellipse(xHeading, yHeading, 20, 20);

      aim = new PVector(xHeading, yHeading);

      dir = PVector.sub(aim, loc);
      dir.normalize();
      dir.mult(0.5);
      acc = dir;
      angle = acc.heading() + radians(90);
      vel.add(acc);
      vel.limit(speed);
      loc.add(vel);


      addBullet(new Bullet(loc.x, loc.y, angle));
    } else {
      playerClose = false;
      dir.rotate(25);
      timer = millis() + 500;
    }

    ////// this works for shooting
    //float dir = (c - angle) / TWO_PI;
    //dir -= round(dir);
    //dir *= TWO_PI;
    //println(dir);
    ////angle += dir;
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
    acc.rotate(c);

    flipping = false;
  }
}
