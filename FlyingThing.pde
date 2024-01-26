abstract class FlyingThing {
  protected PVector pos;
  protected float direction;
  protected float velocity = 1;
  protected float rotationVelocity = 0;
  protected float size = random(10, 30);
  
  public FlyingThing(PVector pos, float direction) {
    this.pos = pos;
    this.direction = direction;
  }
  
  public FlyingThing(PVector pos, float direction, float velocity, float size) {
    this.pos = pos;
    this.direction = direction;
    this.velocity = velocity;
  }
  
  abstract void render();
  
  void move() {
    this.direction = this.direction + this.rotationVelocity;
    this.pos.x = this.pos.x + (sin(-this.direction)*this.velocity);
    this.pos.y = this.pos.y + (cos(-this.direction)*this.velocity);
    
    if (this.rotationVelocity < 0.005 && this.rotationVelocity > -0.005) this.rotationVelocity = 0;
    
    if (this.rotationVelocity > 0) {
      this.rotationVelocity = this.rotationVelocity - 0.006;
    }
    
    if (this.rotationVelocity < 0) {
      this.rotationVelocity = this.rotationVelocity + 0.006;
    }
    
    if (this.pos.x < -size/2) this.pos.x = width+size/2;
    else if (this.pos.x > width+size/2) this.pos.x = -size/2;
    
    if (this.pos.y < -size/2) this.pos.y = height+size/2;
    else if (this.pos.y > height+size/2) this.pos.y = -size/2;
  }
  
  public void turnLeft() {
    this.rotationVelocity = .1;
  }
  
  public void turnRight() {
    this.rotationVelocity = -.1;
  }
  
  public PVector getPos() { return this.pos; }
  public float getSize() { return this.size; }
  public float getDirection() { return this.direction; }
}
