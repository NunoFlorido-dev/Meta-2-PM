import processing.sound.*;
Visualizador2 vis2;
void setup() {
  vis2=new Visualizador2();
}

void settings() {
  int sizeW=1200;
  int sizeH=800;
  size(sizeW, sizeH);
}
void musicSelected(File musicFile){
  vis2.musicSelected(musicFile);
}
void mousePressed() {
 vis2.mousePressed();
}
  
void draw() {
  vis2.displayVis();
}
