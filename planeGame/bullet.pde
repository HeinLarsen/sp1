class Bullet {
  int speed;
  float xpos;
  float ypos;
  float angle;

  Bullet(float xpos, float ypos, float angle) {
    speed = 10;
    this.xpos = xpos;
    this.ypos = ypos;
    this.angle = angle;
  }

  void run() {
    render();
    move();
  }

  void render() {
    pushMatrix();
    translate(xpos, ypos);
    rotate(angle);
    rect(0, 0, 3, 10);
    popMatrix();
  }

  void move() {
    xpos += sin(angle) * speed;
    ypos -= cos(angle) * speed;
  }
}
