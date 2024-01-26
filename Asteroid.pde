public class Asteroid extends FlyingThing {
  public Asteroid() {
    super(new PVector(random(0, width), random(0, height)), random(100, 300));
  }
  
  private Asteroid(PVector pos, float size) {
    super(new PVector(pos.x, pos.y), random(0, 2*PI), 1.0, size);
  }
  
  void render() {
    if (!isAlive()) return;
    this.move();
    fill(0);
    stroke(255);
    ellipse(this.pos.x, this.pos.y, size, size);
  }
  
  private boolean isDead = false;
  
  public void die() {
    this.isDead = true;
  }
  
  public boolean isAlive() {
    return !this.isDead;
  }
  
  public List<Asteroid> hit() {
    this.die();
    ArrayList<Asteroid> newAsteroids = new ArrayList();
    if (this.size < 40) {
      return newAsteroids;
    }
    
    float newSize = this.size/2;
    newAsteroids.add(new Asteroid(this.pos, newSize));
    newAsteroids.add(new Asteroid(this.pos, newSize));
    
    this.die();
    return newAsteroids;
  }
}
