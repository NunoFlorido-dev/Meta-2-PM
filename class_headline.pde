class Headline {
  PFont font;
  String fileName;
  float xText, yText, yDownText, yUpText;
  PVector textVector;
  String conc;
  int vel;

  Headline(PFont font_input, String musicFilename) {
    textAlign(LEFT);
    font = font_input;
    fileName = musicFilename;
    xText = width;
    yDownText = height-10;
    yUpText = 30;
    yText = yUpText;
    textVector=new PVector(xText, yText);
    vel = 2;
    conc = "Now Playing:" + " " + "'" + fileName + "'";
  }

  void update() {
    textVector.x = textVector.x - vel;
    if (textVector.x + textWidth(conc) < 0) {
      textVector.y = yDownText;
      vel = -vel;
    } else if (textVector.x > width) {
      textVector.y = yUpText;
      vel = -vel;
    }
  }

  void display() {
    fill(0);
    textSize(35);
    text(conc, textVector.x, textVector.y);
    update();
  }
}
