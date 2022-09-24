class Plane {
  float speed, xpos, ypos, angle, w, padding;
  ArrayList<Bullet> bullets;
  int life;
  PVector loc;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  PShape s;

  public Plane() {
    padding = 40;
    bullets = new ArrayList<Bullet>();
  }



  void display() {
    PVector mouse = new PVector(xpos, ypos);
    PVector acceleration = PVector.sub(mouse, loc);
    acceleration.setMag(0.5);
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    loc.add(velocity);
    s.resetMatrix();
    s.translate(loc.x, loc.y);
    s.rotate(radians(atan2(loc.y - ypos, loc.x - xpos) * 180 / PI));
    shape(s);


    // chaser
    xpos += sin(angle) * speed;
    ypos -= cos(angle) * speed;
    pushMatrix();
    translate(xpos, ypos);
    rotate(angle);
    if (debug) {
      rect(0, 0, 10, 20);
    }
    popMatrix();
    for (Bullet b : bullets) {
      b.run();
    }
  }



  void left() {
    angle -= radians(w);
  }

  void right() {
    angle += radians(w);
  }

  void addBullet(Bullet b) {
    bullets.add(b);
  }
}
