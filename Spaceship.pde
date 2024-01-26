class Spaceship extends FlyingThing {

  private final int MAX_SPEED = 5;

  private int lives = 3;
  private int immortabilityFrames = 0;
  
  private long lastShot = 0;

  public Spaceship() {
    super(new PVector(width/2, height/2), 0.0, 0, 40);
  }
  
  public Bullet shoot() {
    long now = System.currentTimeMillis();
    if (now - lastShot > 100) {
      this.lastShot = now;  
      return new Bullet(this.pos.copy(), this.direction, this.velocity);
    }
    return null;
  }

  public void render() {
    this.move();

    if ((this.immortabilityFrames / frameRate*2.5) % 1 < 0.5) {
      fill(255);
      pushMatrix();
      translate(this.pos.x, this.pos.y);
      rotate(this.direction);
      new Assets().drawSpaceship();
      popMatrix();
    }

    if (this.immortabilityFrames > 0) this.immortabilityFrames = this.immortabilityFrames - 1;
  }

  public void speedUp() {
    this.velocity = this.velocity + 0.5;
    if (this.velocity > MAX_SPEED) this.velocity = MAX_SPEED;
  }

  public void brake(boolean force) {
    if (force) this.velocity = this.velocity - 0.1;
    else this.velocity = this.velocity - 0.07;
    if (this.velocity < 0) this.velocity = 0;
  }

  public boolean hit() {
    if (immortabilityFrames > 0) return false;
    this.lives = this.lives-1;
    this.pos = new PVector(width/2, height/2);
    this.velocity = 0;
    this.rotationVelocity = 0;
    this.direction = 0;
    this.immortabilityFrames = (int) frameRate * 3;
    return true;
  }

  public int getLives() {
    return this.lives;
  }
}
