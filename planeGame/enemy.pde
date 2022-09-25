class Enemy extends Plane {
  boolean flipping = false;
  int time;
  int bulletCount = 0;
  int reloadTime = 0;
  boolean playerClose = false;
  boolean reload = false;
  float d;
  PVector aim;



  public Enemy() {
    life = 3;
    speed = 2.5;
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

    if (playerClose && time < millis()) {
      findPlayer();
    } else {
      movement();
    }
    
    if(reloadTime < millis() && reload) {
      reload = false;
      bulletCount = 0;
    }
  }


  void startPos() {
    loc.x = random(20, width - 20);
    loc.y = random(20, height - 20);
    angle = radians(calcAtan(loc.y, height/2, loc.x, width/2));
  }

  void searchPlayer() {
    d = PVector.dist(p1.loc, loc);
    playerClose = d < 350 ? true : false;
  }

  void findPlayer() {
    if (d > 300 && d < 350) {
      dir = PVector.sub(p1.loc, loc);
      dir.normalize();
      acc = dir;
      vel.add(acc);
      vel.limit(speed);
      loc.add(vel);
    } else if (d > 150 && d < 300) {
      float xHeading = p1.loc.x + cos(p1.dir.heading()) * 100;
      float yHeading = p1.loc.y + sin(p1.dir.heading()) * 100;

      //ellipse(xHeading, yHeading, 20, 20);

      aim = new PVector(xHeading, yHeading);


      dir = PVector.sub(aim, loc);
      dir.normalize();
      dir.mult(0.5);
      acc = dir;
      angle = acc.heading() + radians(90);
      vel.add(acc);
      vel.limit(speed);
      loc.add(vel);



      if (!reload && bulletTimer < millis()) {
        addBullet(new Bullet(loc.x, loc.y, angle));
        bulletTimer = millis() + 150;
        bulletCount++;
        if (bulletCount == 3) {
          reloadTime = millis() + 1500;
          reload = true;
        }
      }
    } else {
      playerClose = false;
      dir.rotate(25);
      time = millis() + 250;
    }
  }




  void borders() {
    if (loc.x < -padding) loc.x = width+padding;
    if (loc.y < -padding) loc.y = height+padding;
    if (loc.x > width+padding) loc.x = -padding;
    if (loc.y > height+padding) loc.y = -padding;
  }

  void flip() {
    flipping = true;

    angle = radians(calcAtan(height/2, loc.y, width/2, loc.x));

    flipping = false;
  }
}
