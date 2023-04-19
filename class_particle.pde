class Particle {
  color cor;
  PVector location, velocity;
  float lifespan;
  Particle(PVector l) {
    cor=color(200);
    location=l;
    velocity=new PVector(random(-1,1),random(-5,-3));
    lifespan=255;
  }
  void update() {
    location.add(velocity);
    lifespan-=2;
  }
  boolean isDead() {
    if (lifespan<0.0) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    fill(cor, lifespan);
    noStroke();
    circle(location.x, location.y, 30);
  }
}
