Player p1;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
PVector center = new PVector(width/2, height/2);


void setup() {
  size(1920, 1080);
  shapeMode(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  p1 = new Player();
  for (int i = 0; i < 5; i++) {
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
}

void playerControl() {
    if (mousePressed == true) {
      p1.addBullet(new Bullet(p1.loc.x, p1.loc.y, p1.vel.heading() + radians(90) ));
  }
}

float calcAtan(float x1, float x2, float y1, float y2) {
  return atan2(y2 - y1, x2 - x1) * 180 / PI;
}
