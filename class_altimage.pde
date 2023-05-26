class AltImage {
  int nVersão = 2;
  int loc2;
  int y2;
  int x2;
  int xfor1;
  float amp;
  int t;
  float h, s, b;
  SoundFile musica;
  AltImage() {
  }


  void getvar(int locget, int yget, int xget, float xforget, float amp1, int tget, PImage img) {
    loc2 = locget;
    y2 = yget;
    x2 = xget;
    xfor1 = int(xforget);
    amp = amp1;
    t = tget;
    //h,s e b da imagem
    h = hue(img.pixels[loc2]);
    s = saturation(img.pixels[loc2]);
    b = brightness(img.pixels[loc2]);
  }

  void versão1(PImage img) {
    img.pixels[loc2] = color(h, s, b/4 + amp * 100);
    img.updatePixels();
  }


  void versão2(PImage img, BeatDetector beat) {
    if (beat.isBeat()) {
      img.pixels[loc2]=color(h + y2*10*amp, s, b);
      img.updatePixels();
    }
  }


  void versão3(float a, float b1, float c, float d, PImage img) {
    float yf=map(a, 0, 0.6, 0, img.height);
    float z=map(dist(0, y2, 0, yf), 0, c * 400, 0, (y2 * 10 * b));
    if (y2 < yf + d * 400 && y2 > yf - c * 400) {
      img.pixels[loc2] = color(h + (y2 * 10 * b1) - z - dist(x2, 0, xfor1, 0), s, b);
    }
    img.updatePixels();
  }


  void versão4(float a, float b1, PImage img, BeatDetector beat) {
    if (dist(x2, y2, xfor1, random(0, img.height)) < a * 1000) {
      if (beat.isBeat()) {
        img.pixels[loc2] = color(h + 100 * a, s + 200 * b1, b);
      } else {
        img.pixels[loc2] = color(h + 10, s, b);
      }
    }
    img.updatePixels();
  }


  void versão5(float a, float b1, float c, float d, float e, PImage img, BeatDetector beat) {
    if (beat.isBeat() || amp > 0.6 || b1 > 0.3) {
      if (y2 % a * 400 >= amp * 10) {
        img.pixels[loc2] = color(2 * h/5 + 3 * t/5, s/2 + amp * 50, b - amp * c * 10);
      }
    } else {
      if (y2 % (a * 400) >= a * 40) {
        img.pixels[loc2] = color(h/2 + t/2, s + d * 10, b + e * 10);
      } else {
        img.pixels[loc2] = color(h, s, b);
      }
    }
    img.updatePixels();
  }


  void versão6(PImage img) {
    img.pixels[loc2] = color(t, s + amp*10, b + y2/img.height);
    img.updatePixels();
  }


  void desenha(PImage img) {
    image(img, width/2, height/2, img.width, img.height);
  }


  boolean insideTheImage(PImage img) {
    if (mouseX < width/2 + img.width/2 && mouseX > width/2 - img.width/2 &&
      mouseY < height/2 + img.height/2 && mouseY > height/2 + img.height/2) {
      return true;
    } else {
      return false;
    }
  }
}
