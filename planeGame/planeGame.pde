Plane plane;
PShape planeShape;

void setup() {
  size(1280, 720);
  plane = new Plane();
  rectMode(CENTER);
}

void draw() {
  background(94, 225, 255);
  plane.display();
  movement();
}

void movement() {
  if (keyPressed) {
    if (keyCode == LEFT) {
      plane.left();
    }
    if (keyCode == RIGHT) {
      plane.right();
    }
    if (keyCode == UP) {
      plane.addBullet(new Bullet());
    }
  }
}
