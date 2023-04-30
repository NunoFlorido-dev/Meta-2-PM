class ParticleFundo extends Particle {
  float raio;
  int c, c2;
  float bright;
  ParticleFundo(PVector l) {
    super(l);
    c = int(random(200, 255));
    c2=int(random(0, 200));
    raio = random(300, 600);
    velocity = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
  }
  void update(float t) {
    location.add(velocity);
    if (location.x < 0 || location.x > width) {
      velocity.x =- velocity.x;
    } else if (location.y > height || location.y < 0) {
      velocity.y =- velocity.y;
    }
    bright = t;
  }

  void display() {
    fill(c, 255 - c2, 0, bright);
    noStroke();
    circle(location.x, location.y, raio);
  }
}
