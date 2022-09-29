class Enemy extends Plane {
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
    speed = 5;
    angle = radians(0);
    w = 4;
    loc = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dir = new PVector(random(2000), random(2000));

    pl = loadImage("evil spit.png");
    s = createShape(RECT, 0, 0, 20, 40);
    s.setFill(false);
    s.setStroke(false);
    padding = 50;
  }

  void run() {
    dir.x += sin(dir.heading()) * speed;
    dir.y -= cos(dir.heading()) * speed;
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
    loc.x = random(random(0, width/2 - 400), random(width/2 + 500, width) );
    loc.y = random(random(0, height/2 - 400), random(height/2 + 500, height));
    angle = atan2(height/2 - loc.y, width/2 - loc.x);
  }

  void searchPlayer() {
    d = PVector.dist(p1.loc, loc);
    playerClose = d < 300 ? true : false;
  }

  void findPlayer() {
    if (d > 250 && d < 300) {

      PVector acc = PVector.sub(p1.loc, loc);
      // Set magnitude of acceleration
      acc.setMag(0.2);

      // Velocity changes according to acceleration
      vel.add(acc);
      // Limit the velocity by topspeed
      vel.limit(speed);
      // Location changes by velocity
      loc.add(vel);
    } else if (d > 0 && d < 250) {

      float distance = dist(loc.x, loc.y, p1.loc.x, p1.loc.y);
      float xHeading = p1.loc.x + cos(p1.vel.heading()) * 200;
      float yHeading = p1.loc.y + sin(p1.vel.heading()) * 200;



      aim = new PVector(xHeading, yHeading);



      PVector acc = PVector.sub(aim, loc);
      // Set magnitude of acceleration
      acc.setMag(0.2);

      // Velocity changes according to acceleration
      vel.add(acc);
      // Limit the velocity by topspeed
      vel.limit(speed);
      // Location changes by velocity
      loc.add(vel);
      if (!reload && bulletTimer < millis()) {
        addBullet(new Bullet(loc.x, loc.y, (vel.heading() + radians(90)) ));
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
