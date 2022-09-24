class Plane {
  float speed, xpos, ypos, angel, w, padding;
  ArrayList<Bullet> bullets;
  int life;
  PShape s;

  public Plane() {
    padding = 40;
    bullets = new ArrayList<Bullet>();
  }



  void display() {
    s.resetMatrix();
    s.translate(xpos, ypos);
    s.rotate(angel);
    shape(s);
    xpos += sin(angel) * speed;
    ypos -= cos(angel) * speed;
    for (Bullet b : bullets) {
      b.run();
    }
  }



  void left() {
    angel -= radians(w);
  }

  void right() {
    angel += radians(w);
  }

  void addBullet(Bullet b) {
    bullets.add(b);
  }
}
