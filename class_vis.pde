class Visualizador {
  float rectHeight, radius, rectSize;
  color vis_color;
  FFT fft_vis;
  Visualizador(FFT fft) {
    radius=200;
    rectSize=10;
    vis_color=color(0);
    fft_vis=fft;
  }
  void update() {
  }
  void display(int inverteX) {
    float xcenter=width/2;
    float ycenter=height/2;
    int ninetydegrees=90;
    push();
    translate(xcenter, ycenter);
    for (int i=0; i<numBands; i++) {
      float[] espectro=fft_vis.analyze();
      rectHeight=map(espectro[i], 0, 100, 0, 100000);
      float angleStep=(PI/4)/numBands;
      float setAng=3*(PI/4)+TWO_PI/8;
      float x = radius * cos((i * angleStep)+setAng);
      float y = radius * sin((i * angleStep)+setAng);
      push();
      scale(inverteX, 1);
      translate(x, y);
      rotate(i * angleStep + radians(ninetydegrees));
      fill(vis_color);
      rect(0, 0, rectSize, rectHeight);
      pop();
    }
    pop();
  }
}
