class Plane {
  float speed, angle, w, padding;
  ArrayList<Bullet> bullets;
  int life;
  PVector loc;
  PVector vel;
  PShape s;
  float bulletTimer;
  int id = int(random(0, 1000));

  public Plane() {
    padding = 40;
    bullets = new ArrayList<Bullet>();
  }



  void display() {
    vel.x += sin(angle) * speed;
    vel.y -= cos(angle) * speed;
    vel.limit(speed);
    loc.add(vel);
    
    s.resetMatrix();
    s.translate(loc.x, loc.y);
    s.rotate(vel.heading());
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
  }

  void right() {
    angle += radians(w);
  }

  void addBullet(Bullet b) {
    if (bulletTimer < millis()) {
      bulletTimer = millis() + 250;
      bullets.add(b);
    }
  }
}
