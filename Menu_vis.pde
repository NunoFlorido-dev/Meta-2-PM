class MenuVisAll {
  PFont meta1Fonte, meta2Fonte;

  MenuVisAll(PFont fonte1, PFont fonte2) {
    colorMode(RGB, 255, 255, 255);
    rectMode(CORNER);
    meta1Fonte = fonte1;
    meta2Fonte = fonte2;
  }
  void textoMeta1() {
    textAlign(CENTER);
    textFont(meta1Fonte);
    textSize(50);
    fill(255);
    text("Visualizador 1", width/4, height/2);
  }
  void textoMeta2() {
    textAlign(CENTER);
    textFont(meta2Fonte);
    textSize(40);
    fill(255);
    text("Visualizador 2", (width/4)*3, height/2);
  }
  boolean mouseHover() {
    if (mouseX < width/2) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    rectMode(CORNER);
    colorMode(RGB, 255, 255, 255);
    color blue = color(0, 0, 200);
    color blueHover = color(0, 0, 255);
    color red = color(200, 0, 0);
    color redHover = color(255, 0, 0);
    color left = blue;
    color right = red;
    if (mouseHover()) {
      left = blueHover;
      right = red;
    } else {
      left = blue;
      right = redHover;
    }
    noStroke();
    fill(right);
    rect(width/2, 0, width, height);
    fill(left);
    rect(0, 0, width/2, height);
    textoMeta2();
    textoMeta1();
  }
}
