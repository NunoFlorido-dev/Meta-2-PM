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
ArrayList<ParticleFundo> pm = new ArrayList<ParticleFundo>();
color display_color = color(0, 170, 200);
int numBands = 8;
PFont font;
String musicFilename;
boolean activeMusic = false;

void setup() {
  background(display_color);
  colorMode(RGB, 255, 255, 255);
  fft = new FFT(this, numBands);
  vis = new Visualizador(fft);
  ps = new ParticleSystem();
  as = new ArcSystem();
  for (int i=0; i<6; i++) {
    PVector l = new PVector(random(200, 1000), random(120, 680));
    pm.add(i, new ParticleFundo(l));
  }
  font = createFont("Popboy", 30);
  textFont(font);
}

void settings() {
  int sizeW = 1200;
  int sizeH = 800;
  size(sizeW, sizeH);
}

void mousePressed() {
  selectInput( "Select a music file to open:", "musicSelected" );
}

void musicSelected(File musicFile) {
  if (musicFile == null) {
    println("No music selected");
  } else {
    println("Selected music:" + musicFile.getAbsolutePath());
    music=new SoundFile(this, musicFile.getAbsolutePath());
    activeMusic = true;
    if (activeMusic == true) {
      music.loop();
      fft.input(music);
      musicFilename = musicFile.getAbsolutePath();
      head = new Headline(font, musicFilename);
      amp = new Amplitude(this);
      beat = new BeatDetector(this);
      beat.input(music);
      amp.input(music);
    }
  }
}

void draw() {
  background(display_color);
  if (activeMusic) {
    float a = amp.analyze();
    float mudaAmpMini = map(a, 0, 1, 10, 40);
    float mudaAmpMax = map(a, 0, 1, 0, 255);
    for (ParticleFundo p : pm) {
      p.display();
      p.update(mudaAmpMax);
    }
    if (beat.isBeat()) {
      as.addArco();
    }
    as.run();
    vis.display(-1);
    vis.display(1);
    ps.addParticle();
    ps.run(mudaAmpMini);
    head.display();
  }
}
