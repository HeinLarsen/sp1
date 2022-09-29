class Enemy extends Plane {
  boolean flipping = false;
  int time;
  int bulletCount = 0;
  int reloadTime = 0;
  boolean playerClose = false;
  boolean reload = false;
  float d;
  PVector aim;
  float angleToPlayer;



  public Enemy() {
    life = 3;
    speed = 3;
    angle = radians(0);
    w = 4;
    loc = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dir = new PVector(0, 0);
    
    pl = loadImage("evil spit.png");
    s = createShape(RECT, 0, 0, 20, 40);
    s.setFill(false);
    s.setStroke(false);
    padding = 50;
  }

  void run() {
    borders();
    searchPlayer();

    if (playerClose && time < millis()) {
      findPlayer();
    } else {
      movement();
    }

    if (reloadTime < millis() && reload) {
      reload = false;
      bulletCount = 0;
    }

    display();
  }


  void startPos() {
    loc.x = random(random(0, width/4), random(width/2 + 300, width) );
    loc.y = random(random(0, height/4), random(height/2 + 300, height));
    angle = atan2(height/2 - loc.y, width/2 - loc.x);
  }

  void searchPlayer() {
    d = PVector.dist(p1.loc, loc);
    playerClose = d < 400 ? true : false;
  }

  void findPlayer() {
    if (d > 250 && d < 400) {
      dir = PVector.sub(p1.loc, loc);
      dir.normalize();
      dir.mult(0.5);
      acc = dir;
      angle = acc.heading() + radians(90);
      vel.add(acc);
      vel.limit(speed);
      loc.add(vel);
    } else if (d > 0 && d < 250) {
      float xHeading = p1.loc.x + cos(p1.dir.heading()) * 100;
      float yHeading = p1.loc.y + sin(p1.dir.heading()) * 100;



      aim = new PVector(xHeading, yHeading);



      dir = PVector.sub(aim, loc);
      dir.normalize();
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
}
