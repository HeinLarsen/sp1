Plane plane;

void setup() {
  size(1280, 720);
  plane = new Plane();
  surface.setResizable(true);
  rectMode(CENTER);
}

void draw() {
  background(94, 225, 255);
  plane.display();
  movement();
  rect(200, 200, 20, 20);
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
      plane.addBullet(new Bullet(plane.xpos, plane.ypos, plane.angel));
    }
  }
}
