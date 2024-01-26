public class Bullet extends FlyingThing {
  public void render() {
    if (framesAlive <= 0) {
      this.die();
    } else {
      this.framesAlive = this.framesAlive - 1;
    }
    this.move();
    fill(255);
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(this.direction);
    ellipse(0, 0, 5, 10);
    popMatrix();
  }
  
  private int framesAlive = (int) frameRate * 3;
  private boolean isDead = false;
  
  public void die() {
    this.isDead = true;
  }
  
  public boolean isAlive() {
    return !this.isDead;
  }
  
  public Bullet(PVector pos, float direction, float speed) {
    super(pos, direction, speed+3, 10.0);
  }
}
