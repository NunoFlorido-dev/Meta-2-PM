class Headline {
  PFont font;
  String fileName;
  float xText, yText, yDownText, yUpText;
  String conc;
  int vel=2;
  Headline(PFont font_input, String musicFilename) {
    font=font_input;
    fileName=musicFilename;
    xText=width;
    yDownText=height-10;
    yUpText=30;
    yText=yUpText;
    conc="Now Playing:" + " " + "'" + fileName + "'";
  }

  void update() {
    xText=xText-vel;
    if (xText+textWidth(conc)<0) {
      yText=yDownText;
      vel=-vel;
    } else if (xText>width) {
      yText=yUpText;
      vel=-vel;
    }
  }

  void display() {
    fill(0);
    text(conc, xText, yText);
    xText=xText-vel;
    update();
  }
}
