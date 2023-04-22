class Particle {
  color cor;
  PVector location, velocity;
  float lifespan;
  float raio;
  Particle(PVector l) {
    cor=color(200);
    location=l;
    velocity=new PVector(random(-1,1),random(-5,-3));
    lifespan=255;
  }
  void update(float r) {
    location.add(velocity);
    lifespan-=2;
    raio=r;
  }
  boolean isDead() {
    if (lifespan<0) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    fill(cor, lifespan);
    noStroke();
    circle(location.x, location.y, raio);
  }
}
