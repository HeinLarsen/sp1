class Plane {
  float speed, xpos, ypos, angel, w;
  ArrayList<Bullet> bullets;

  Plane() {
    speed = 2;
    xpos = width/2;
    ypos = height/2;
    angel = radians(0);
    w = 5;
    bullets = new ArrayList<Bullet>();
  }

  void display() {
    translate(xpos, ypos);
    rotate(angel);
    rect(0, 0, 40, 82);
    xpos += sin(angel) * speed;
    ypos -= cos(angel) * speed;
    for (Bullet b : bullets) {
       b.display(bullets, xpos, ypos, angel);
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
