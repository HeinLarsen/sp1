Player p1;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean debug = true;
PVector center = new PVector(width/2, height/2);

void setup() {
  size(1920, 1080);
  shapeMode(CENTER);
  rectMode(CENTER);
  p1 = new Player();
  for (int i = 0; i < 1; i++) {
    enemies.add(new Enemy());
    enemies.get(i).startPos();
  }
  surface.setResizable(true);
}

void draw() {
  background(94, 225, 255);
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).run();
  };
  playerControl();
  p1.run();
  deletePlane();
}

void playerControl() {
  if (keyPressed) {
    if (keyCode == LEFT) {
      p1.left();
    }
    if (keyCode == RIGHT) {
      p1.right();
    }
    if (keyCode == UP) {
      p1.addBullet(new Bullet(p1.loc.x, p1.loc.y, p1.angle));
    }
  }
}

float calcAtan(float x1, float x2, float y1, float y2) {
  return atan2(y2 - y1, x2 - x1) * 180 / PI;
}

void deletePlane() {
  for (int i = 0; i < enemies.size(); i++) {
    Enemy en = enemies.get(i);
    if (en.loc.x < -en.padding || en.loc.y < -en.padding || en.loc.x > width+en.padding || en.loc.y > height+en.padding) {
      println("Removed " + i);
      enemies.remove(i);
    }
  }
}
