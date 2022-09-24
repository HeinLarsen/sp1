Player p1;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

void setup() {
  size(1920, 1080);
  shapeMode(CENTER);
  rectMode(CENTER);
  p1 = new Player();
  for (int i = 0; i < 10; i++) {
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
  movement();
  p1.run();
  deletePlane();
}

void movement() {
  if (keyPressed) {
    if (keyCode == LEFT) {
      p1.left();
    }
    if (keyCode == RIGHT) {
      p1.right();
    }
    if (keyCode == UP) {
      p1.addBullet(new Bullet(p1.xpos, p1.ypos, p1.angel));
    }
  }
}

void deletePlane() {
  for (int i = 0; i <enemies.size(); i++) {
    Enemy en = enemies.get(i); 
    if (en.xpos < -en.padding || en.ypos < -en.padding || en.xpos > width+en.padding || en.ypos > height+en.padding) {
      enemies.remove(i);
      println("Removed " + i);
    }
  }
}
