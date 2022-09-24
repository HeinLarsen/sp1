class Plane {
  float speed, angle, w, padding;
  ArrayList<Bullet> bullets;
  int life;
  PVector loc;
  PShape s;

  public Plane() {
    padding = 40;
    bullets = new ArrayList<Bullet>();
  }



  void display() {
    loc.x += sin(angle) * speed;
    loc.y -= cos(angle) * speed;
    s.resetMatrix();
    s.translate(loc.x, loc.y);
    s.rotate(angle);
    shape(s);

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
