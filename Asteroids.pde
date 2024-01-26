Spaceship player;
KeyboardManager km = new KeyboardManager();
ArrayList<Asteroid> asteroids = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();

void setup() {
  size(900, 500);
  background(0);
  
  for (int i = 0; i < 5; i++) asteroids.add(new Asteroid());
  
  println(PVector.angleBetween(new PVector(0, 0), new PVector(1, 0)));
  
  player = new Spaceship();
}

void draw() {
  background(0);
  
  for (int i = 0; i < player.getLives(); ++i) {
    pushMatrix();
    translate(i * 30 + 30, 60);
    new Assets().drawSpaceship();
    popMatrix();
  }
  
  if (player.getLives() == 0) {
    fill(255);
    textAlign(CENTER);
    textSize(128);
    text("Game Over", width/2, height/2);
    return;
  }
  
  if (random(0, 100) > 95 && asteroids.size() < 10) asteroids.add(new Asteroid());
  
  if (km.isPressed('w')) {
    player.speedUp();
  } else {
    player.brake(km.isPressed('s'));
  }
  
  if (km.isPressed('a')) {
    player.turnRight();
  }
  if (km.isPressed('d')) {
    player.turnLeft();
  }
  
  player.render();
  for (int i = asteroids.size()-1; i >= 0; --i) {
    if (!asteroids.get(i).isAlive()) {
      asteroids.remove(i);
      continue;
    }
    asteroids.get(i).render();
    if (asteroids.get(i).getPos().dist(player.getPos()) <= asteroids.get(i).getSize()) {
      if (player.hit()) {
        print("HIT");
      }
    }
  }
  
  for (int i = bullets.size()-1; i >= 0; --i) {
    if (bullets.get(i) == null) {
      bullets.remove(i);
      continue;
    }
    if (!bullets.get(i).isAlive()) {
      bullets.remove(i);
      continue;
    }
    bullets.get(i).render();
    List<Asteroid> newAsteroids = new ArrayList();
    for (int j = 0; j < asteroids.size(); ++j) {
      Asteroid currentAsteroid = asteroids.get(j);
      Bullet currentBullet = bullets.get(i);
      if (currentAsteroid.getPos().dist(currentBullet.getPos()) <= currentAsteroid.getSize()) {
        bullets.get(i).die();
        newAsteroids.addAll(asteroids.get(j).hit());
      }
    }
    asteroids.addAll(newAsteroids);
  }
}

void keyPressed() {
  km.press(key);
  
  if (key == ' ') {
    bullets.add(player.shoot());
  }
}

void keyReleased() {
  km.release(key);
}
