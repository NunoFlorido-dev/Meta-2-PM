import processing.sound.*;
import processing.video.*;
SoundFile music;
Visualizador vis;
FFT fft;
Headline head;
ParticleSystem ps;
Amplitude amp;
BeatDetector beat;
ArcSystem as;
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
  as=new ArcSystem();
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
      amp=new Amplitude(this);
      beat=new BeatDetector(this);
      beat.input(music);
      amp.input(music);
    }
  }
}

void draw() {
  background(display_color);
  if (activeMusic) {
    float a=amp.analyze();
    float m=map(a, 0, 1, 10, 40);
    if (beat.isBeat()) {
      as.addArco();
    }
    as.run();
    vis.display(-1);
    vis.display(1);
    ps.addParticle();
    ps.run(m);
    head.display();
  }
}
