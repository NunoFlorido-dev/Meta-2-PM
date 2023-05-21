import processing.sound.*;
Visualizador1 vis1;
Visualizador2 vis2;
StartTexts StartTexts;
MenuVisAll menuvis;
int visNum;
PFont fonteVis1;
PFont fonteVis2;
boolean chooseVis = true;
boolean ativaText = true;
void setup() {
  colorMode(RGB, 255, 255, 255);
  fonteVis1 = createFont("Heal The Web A", 16);
  fonteVis2 = createFont("Popboy", 30);
  visNum = -1;
  menuvis = new MenuVisAll(fonteVis1, fonteVis2);
  vis1=new Visualizador1();
  vis2=new Visualizador2();
  StartTexts= new StartTexts();
  if (visNum == 0) {
    chooseVis = true;
  } else {
    chooseVis = false;
  }
  frameRate(30);
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
  boolean ativaMainMenu = false;
  if(visNum == -1){
    ativaMainMenu = !ativaMainMenu;
   visNum = 0;
  }
  if (visNum == 0) {
    if(!ativaMainMenu){
    if (menuvis.mouseHover()) {
      visNum = 1;
      chooseVis = false;
    } else {
      visNum = 2;
      chooseVis = false;
    }
  }}
  if (!chooseVis) {
    if (visNum == 1) {
      vis1.mousePressed();
    } else if (visNum == 2) {
      vis2.mousePressed();
    }
  }
}



void keyPressed() {
  if (visNum==-1) {
    visNum=0;
  }
  if (!chooseVis) {
    if (visNum == 1) {
      vis1.keyPressed();
    }
  }
}
void draw() {
  background(255);
  if (visNum==-1) {
      StartTexts.desenho();
  } else if (visNum == 0) {
    menuvis.display();
  } else if (visNum == 1) {
    textFont(fonteVis1);
    vis1.displayVis();
  } else if (visNum == 2) {
    textFont(fonteVis2);
    vis2.displayVis();
  }
}
