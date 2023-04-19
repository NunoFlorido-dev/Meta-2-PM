import processing.sound.*;
SoundFile music;
Visualizador vis;
FFT fft;
Headline head;
ParticleSystem ps;
color display_color=color(255);
int numBands=8;
PFont font;
String musicFilename;
boolean activeMusic=false;
void setup() {
  background(display_color);
  fft=new FFT(this, numBands);
  vis=new Visualizador(fft);
  ps=new ParticleSystem();
  font=createFont("Popboy", 30);
  textFont(font);
}

void settings() {
  int sizeW=1200;
  int sizeH=800;
  size(sizeW, sizeH);
}

void mousePressed() {
  selectInput("Select a music file to open:", "musicSelected");
}

void musicSelected(File musicFile) {
  if (musicFile==null) {
    println("No music selected");
  } else {
    println("Selected music:" + musicFile.getAbsolutePath());
    music=new SoundFile(this, musicFile.getAbsolutePath());
    activeMusic=true;
    if (activeMusic==true) {
      music.loop();
      fft.input(music);
      musicFilename=musicFile.getAbsolutePath();
      head=new Headline(font, musicFilename);
    }
  }
}

void draw() {
  background(display_color);
  if (activeMusic) {
    vis.display(-1);
    vis.display(1);
    ps.addParticle();
    ps.run();
    head.display();
  }
}
