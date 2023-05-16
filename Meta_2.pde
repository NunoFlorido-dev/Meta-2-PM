import processing.sound.*;
Visualizador1 vis1;
Visualizador2 vis2;
MenuVisAll menuvis;
boolean chooseVis = true;
int visNum;
PFont fonteVis1;
PFont fonteVis2;
void setup() {
  colorMode(RGB, 255, 255, 255);
  fonteVis1 = createFont("Heal The Web A", 16);
  fonteVis2 = createFont("Popboy", 30);
  visNum = -1;
  menuvis = new MenuVisAll(fonteVis1, fonteVis2);
  vis1=new Visualizador1();
  vis2=new Visualizador2();
}

void settings() {
  int sizeW=1200;
  int sizeH=800;
  size(sizeW, sizeH);
}
void musicSelected(File musicFile) {
  if (visNum == 1) {
    vis1.musicSelected(musicFile);
  } else if (visNum == 2) {
    vis2.musicSelected(musicFile);
  }
}
void imageSelected(File imageFile) {
  if (visNum == 1) {
    vis1.imageSelected(imageFile);
  }
}
void mousePressed() {
  if (chooseVis) {
    if (menuvis.mouseHover()) {
      visNum = 1;
    } else {
      visNum = 2;
    }
  }
  if (visNum == 1) {
    vis1.mousePressed();
    chooseVis = false;
  } else if (visNum == 2) {
    vis2.mousePressed();
    chooseVis = false;
  }
}


void keyPressed() {
  if (visNum == 1) {
    vis1.keyPressed();
  }
}
void draw() {
  background(255);
  if (chooseVis) {
    menuvis.display();
  } else {
    if (visNum == 1) {
      textFont(fonteVis1);
      vis1.displayVis();
    } else if (visNum == 2) {
      textFont(fonteVis2);
      vis2.displayVis();
    }
  }
}
