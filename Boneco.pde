class boneco {
  int Lolhos = 400, altOlhos;
  int y;
  PImage bonecoCopy;
  PImage olhos;
  PImage boneco;
  Amplitude amp;
  BeatDetector beat;
  int nRasto = 10;
  PImage [ ] imgs = new PImage[nRasto];
  color c1;
  ArrayList <PVector> aa = new ArrayList();
  boneco() {
    boneco = loadImage("aaa.png");
    boneco.loadPixels();
    olhos = loadImage("olhosss.png");
    olhos.loadPixels();
    this.amp = new Amplitude(Meta_2.this);
    this.beat = new BeatDetector(Meta_2.this);
  }


  void eyesrastsetup() {
    //inicialização e criação das imagens q fazem o efeito de sobra/rasto dos olhos
    for (int i = 0; i < nRasto; i++) {
      aa.add(new PVector(0, 0));
    }
    colorMode(ARGB);

    for (int i = 0; i < imgs.length; i++) {
      imgs[i] = createImage(olhos.width, olhos.height, ARGB);
      imgs[i].loadPixels();
      for (int loc = 0; loc < olhos.pixels.length; loc++) {
        if (alpha(olhos.pixels[loc]) > 70) {
          imgs[i].pixels[loc]=color(0, 60 - (i*i*3));
        }
      }
      imgs[i].updatePixels();
    }
  }


  void changeSat(float a) {
    for (int loc = 0; loc < boneco.pixels.length; loc++) {
      colorMode(ARGB);
      c1= color(0, 20);
      if (alpha(boneco.pixels[loc]) > 70) {
        colorMode(HSB);
        boneco.pixels[loc]=color(hue(boneco.pixels[loc]), 10+a*100,
          brightness(boneco.pixels[loc]));
      }
    }
    boneco.updatePixels();
  }
  void eyesrast() {
    aa.add(0, aa.get(nRasto - 1));
    aa.get(0).x = Lolhos;
    aa.get(0).y = altOlhos;
  }
  void eyesmove(float a, float h) {
    // defenir a largura e a altura dos olhos consoante a amplitude 
    Lolhos = 300 + int(a * 700);
    altOlhos = int(map(Lolhos, 0, olhos.width, 0, olhos.height));
    //mudança de cor nos olhos consoante o espectro fft
    for (int i = 0; i < olhos.width; i ++) {
      for (int j = 0; j < olhos.height; j++) {
        int loc = i + j * olhos.width;
        if (alpha(olhos.pixels[loc]) > 70) {
          colorMode(HSB);
          if (saturation(olhos.pixels[loc]) > 25) {
            olhos.pixels[loc] = color(h*360, saturation(olhos.pixels[loc]),
              brightness(olhos.pixels[loc]));
            if (beat.isBeat()) {
              if (i < width/2) {
                y = int(map(dist(i, j, 849, 480), 0, 250, 0, 360));
              } else {
                y = int(map(dist(i, j, 1553, 480), 0, 250, 0, 360));
              }
              olhos.pixels[loc]=color(y, saturation(olhos.pixels[loc]),
                brightness(olhos.pixels[loc]));
            }
          }
          olhos.updatePixels();
        }
      }
    }
  }


  void desenho() {
    imageMode(CENTER);
    image(boneco, width/2 + 20, height - 215, 476, 519);
    for (int i=0; i < imgs.length; i++) {
      image(imgs[i], width/2 + 5, height - 330, aa.get(i).x, aa.get(i).y);
    }
    image(olhos, width/2+5, height-330, Lolhos, altOlhos);
  }
}


