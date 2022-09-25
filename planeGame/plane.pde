class Plane {
  float speed, angle, w, padding;
  ArrayList<Bullet> bullets;
  int life;
  PVector loc;
  PVector vel;
  PVector acc;
  PVector dir;
  PShape s;
  float bulletTimer;

  public Plane() {
    padding = 40;
    bullets = new ArrayList<Bullet>();
  }

  void display() {

    s.resetMatrix();
    s.translate(loc.x, loc.y);
    s.rotate(acc.heading());
    shape(s);
    //pushMatrix();
    //translate(vel.x, vel.y);
    //rotate(vel.heading());
    //rect(0,0,10,20);
    //popMatrix();


    for (Bullet b : bullets) {
      b.run();
    }
  }

  void movement() {
    dir.x += sin(angle) * speed;
    dir.y -= cos(angle) * speed;
    dir.normalize();
    acc = dir;
    acc.setMag(0.5);
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



  void left() {
    angle -= radians(w);
    dir.rotate(-0.1);
  }

  void right() {
    angle += radians(w);
    dir.rotate(0.1);
  }

  void addBullet(Bullet b) {
    if (bulletTimer < millis()) {
      bulletTimer = millis() + 250;
      bullets.add(b);
    }
  }
}
