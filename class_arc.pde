class Arco {
  float raio, lifespan;

  Arco() {
    raio=0;
    lifespan=255;
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    float xcenter = width/2;
    float ycenter = height/2;
    strokeWeight(4);
    stroke(255, 0, 0, lifespan);
    noFill();
    circle(xcenter, ycenter, raio);
  }
  void update() {
    int vel = 2;
    float removeLife = 1;
    raio += vel;
    lifespan -= removeLife;
  }
}
