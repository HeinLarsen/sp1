class Plane {
  float speed, angle, padding, bulletTimer;
  ArrayList<Bullet> bullets;
  int life;
  PVector loc, vel, acc, dir;
  PShape s;
  PImage pl;


  public Plane() {
    padding = 40;
    bullets = new ArrayList<Bullet>();
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading() + radians(90));
    image(pl, 0, 0);
    popMatrix();
    
    s.resetMatrix();
    s.translate(loc.x, loc.y);
    s.rotate(vel.heading() + radians(90));
    shape(s);

    

    for (Bullet b : bullets) {
      b.run();
    }
  }

  void movement() {

    PVector acc = PVector.sub(dir, loc);
    acc.setMag(0.3);

    vel.add(acc);
    vel.limit(speed);
    loc.add(vel);
  }

  void hitDetection() {
    for (int i = 0; i < bullets.size(); i++) {
      for (int j = 0; j < enemies.size(); j++) {
        if (bullets.get(i).ypos > enemies.get(j).loc.y - 20 && bullets.get(i).ypos < enemies.get(j).loc.y + 20) {
          if (bullets.get(i).xpos > enemies.get(j).loc.x - 10 && bullets.get(i).xpos < enemies.get(j).loc.x + 10) {
            println("hit");
            enemies.get(j).life -= 1;
            if (enemies.get(j).life <= 0) {
              println("removing enemy");
              enemies.remove(j);
            }
            bullets.remove(i);
            break;
          }
        }
      }
    }
  }

  void addBullet(Bullet b) {
    if (bulletTimer < millis()) {
      bulletTimer = millis() + 150;
      bullets.add(b);
    }
  }
}
