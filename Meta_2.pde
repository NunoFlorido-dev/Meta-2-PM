import processing.sound.*;
SoundFile music;
Visualizador vis;
FFT fft;
Headline head;
ParticleSystem ps;
Amplitude amp;
int partMenu=0;
Menu[] Menu;
Botao som;
Botao pause;
color display_color=color(255);
int numBands=8;
color c1= color(random(150), random(150), random(150));
PFont font;
String musicFilename;
boolean activeMusic=false;
void setup() {
  background(display_color);
  Menu= new Menu[2];
  Menu[0]= new MenuIn(c1, c1);
  Menu[1]= new BarraMenu(c1, c1);
  fft=new FFT(this, numBands);
  vis=new Visualizador(fft);
  ps=new ParticleSystem();
  amp=new Amplitude(this);
  font=createFont("Popboy", 30);
  textFont(font);

}

void settings() {
  int sizeW=1200;
  int sizeH=800;
  size(sizeW, sizeH);
}

void mousePressed() {
  if (partMenu==0) {
    if (Menu[0].colideBotao(1)==true) {
      selectInput("Select a music file to open:", "musicSelected");
    }
    if (activeMusic==true) {
      if (Menu[0].colideBotao(0)==true) {
        partMenu=1;
        music.loop();
      }
    }
  } else if (partMenu==1) {
    if (Menu[1].colideBotao(0)==true) {
      if ( Menu[1].ShowSondAmp==false) {
        Menu[1].ShowSondAmp=true;
      } else {
        Menu[1].ShowSondAmp=false;
      }
    }
    if (Menu[1].colideBotao(1)==true) {
      if (music.isPlaying()==true) {
        music.pause();
      } else {
        music.play();
      }
      if (music.position()>music.duration()-1) {
        music.loop();
      }
    }
  }
}

void musicSelected(File musicFile) {
  if (musicFile==null) {
    println("No music selected");
  } else {
    println("Selected music:" + musicFile.getAbsolutePath());
    music=new SoundFile(this, musicFile.getAbsolutePath());
    activeMusic=true;
    if (activeMusic==true) {
      fft.input(music);
      musicFilename=musicFile.getAbsolutePath();
      head=new Headline(font, musicFilename);
      amp.input(music);
    }
  }
}

void draw() {
  background(display_color);
  float a = map(amp.analyze(), 0, 1, 5, 40);
  if (activeMusic && partMenu==1) {
    vis.display(-1);
    vis.display(1);
    ps.addParticle();
    ps.run(a);
    head.display();
    Menu[1].desenho();
    Menu[1].jumpMusic();
    if (Menu[1].ShowSondAmp==true) {
      Menu[1].choseAmp();
    }
  } else {
    Menu[0].desenho();
  }
}
