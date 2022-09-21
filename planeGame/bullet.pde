class Bullet {
  float speed, bXpos, bYpos;
  Bullet() {
    speed = 10;
  }

  void display(ArrayList<Bullet> bullets, float xpos, float ypos, float angel) {
    bullet(xpos, ypos, angel);
  }

  void bullet(float xpos, float ypos, float angel) {
    rect(500, 500, 10, 40);
  }
}
