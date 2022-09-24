class Bullet {
  int speed;
  float x;
  float y;
  float angel;

  Bullet(float xpos, float ypos, float angel) {
    speed = 10;
    x = xpos;
    y = ypos;
    this.angel = angel;
  }

  void run() {
    render();
    move();
  }

  void render() {
    pushMatrix();
    translate(x, y);
    rotate(angel);
    rect(0, 0, 3, 10);
    popMatrix();
  }

  void move() {
    x += sin(angel) * speed;
    y -= cos(angel) * speed;
  }
}
