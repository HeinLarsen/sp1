class Plane {
  float speed, xpos, ypos, angel, w;
  ArrayList<Bullet> bullets;
  int id, life;

  Plane() {
    speed = 2;
    xpos = width/2;
    ypos = height/2;
    angel = radians(0);
    w = 5;
    bullets = new ArrayList<Bullet>();
    id = int(random(1000));
  }

  void display() {
    pushMatrix();
    translate(xpos, ypos);
    rotate(angel);
    rect(0, 0, 40, 82);
    xpos += sin(angel) * speed;
    ypos -= cos(angel) * speed;
    popMatrix();
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
