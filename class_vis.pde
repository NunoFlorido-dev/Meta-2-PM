class Visualizador {
  float rectHeight, radius, rectSize;
  color vis_color;
  FFT fft_vis;
  
  Visualizador(FFT fft) {
    radius = 200;
    rectSize = 10;
    vis_color = color(0);
    fft_vis = fft;
  }

  void display(int inverteX) {
    float xcenter = width/2;
    float ycenter = height/2;
    int ninetydegrees = 90;
    push();
    translate(xcenter, ycenter);
    float[] espectro = fft_vis.analyze();
    for (int i = 0; i < numBands; i++) {
      float espectro_c = map(espectro[i], min(espectro), max(espectro), 0, 255);
      rectHeight = map(espectro[i], min(espectro), max(espectro), 0, 300);
      float angleStep = (PI/4)/numBands;
      float setAng = 3*(PI/4)+TWO_PI/8;
      float x = radius * cos((i * angleStep) + setAng);
      float y = radius * sin((i * angleStep) + setAng);
      push();
      scale(inverteX, 1);
      translate(x, y);
      rotate(i * angleStep + radians(ninetydegrees));
      fill(0, 255 - espectro_c, espectro_c, espectro_c);
      noStroke();
      rect(0, 0, rectSize, rectHeight);
      pop();
    }
    pop();
  }
}
