class Visualizador2 {
  //variaveis da musica criadas
  SoundFile music;
  BarrasEspectro barras;
  FFT fft;
  Amplitude amp;
  BeatDetector beat;
  //variaveis do visualizador
  Headline head;
  boneco classBoneco;
  ParticleSystem ps;
  ArrayList<ParticleFundo> pf;
  color display_vis;
  int numBands;
  color c1;
  PFont fonte;
  String musicFilename;
  boolean activeMusic=false;
  color display_color=color(255);
  //variaveis do menu
  int partMenu;
  MenuVis2[] menu = new MenuVis2[2];
  Botao som;
  Botao pause;
  Visualizador2() {
    colorMode(RGB, 255, 255, 255);
    partMenu=0;
    numBands=8;
    pf = new ArrayList<ParticleFundo>();
    display_vis=color(0, 200, 170);
    activeMusic=false;
    this.fft = new FFT(Meta_2.this, 8);
    this.amp = new Amplitude(Meta_2.this);
    beat=new BeatDetector(Meta_2.this);
    c1= color(random(150), random(150), random(150));
    menu = new MenuVis2[2];
    menu[0]= new MenuIn(c1, c1);
    ps = new ParticleSystem();
    for (int i=0; i<4; i++) {
      pf.add(new ParticleFundo
        (new PVector(random(300, 900), random(200, 600))));
    }
    classBoneco= new boneco();
    classBoneco.eyesrastsetup();
  }

  void mousePressed() {
    if (partMenu==0) {
      if (menu[0].colideBotao(1)==true) {
        selectInput("Select a music file to open:", "musicSelected");
      }
      if (activeMusic==true) {
        if (menu[0].colideBotao(0)==true) {
          partMenu=1;
          music.loop();
        }
      }
    } else if (partMenu==1) {
      if (menu[1].colideBotao(0)==true) {
        if ( menu[1].ShowSondAmp==false) {
          menu[1].ShowSondAmp=true;
        } else {
          menu[1].ShowSondAmp=false;
        }
      }
      if (menu[1].colideBotao(1)==true) {
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
    if (musicFile == null) {
      println("No music selected");
    } else {
      println("Selected music: " +
        musicFile.getAbsolutePath());
      this.music = new SoundFile(Meta_2.this,
        musicFile.getAbsolutePath());
      this.activeMusic = true;
      if (this.activeMusic) {
        this.beat.input(this.music);
        this.fft.input(this.music);
        this.musicFilename = musicFile.getAbsolutePath();
        menu[1]= new BarraMenu(c1, c1, music);
        this.head = new Headline(this.fonte, this.musicFilename);
        this.amp.input(this.music);
        barras=new BarrasEspectro(fft, numBands);
      }
    }
  }


  void displayVis() {
    background(display_color);
    if (activeMusic && partMenu==1) {
      float a = map(amp.analyze(), 0, 1, 5, 40);
      float a_bright = map(amp.analyze(), 0, 1, 0, 255);
      float[] espectro=fft.analyze();
  float a1=amp.analyze();
      background(display_vis);
      for (ParticleFundo p : pf) {
        p.display();
        p.update(a_bright);
      }
      if(music.isPlaying()){
      barras.display(-1);
      barras.display(1);}
      ps.addParticle();
      ps.run(a);
      head.display();
      classBoneco.eyesrast();
      classBoneco.changeSat(a1);
      classBoneco.desenho();
      classBoneco.eyesmove(a1,espectro[1]);
      menu[1].desenho();
      menu[1].jumpMusic();
      if (menu[1].ShowSondAmp==true) {
        menu[1].choseAmp();
      }
    } else {
      menu[0].desenho();
    }
  }
}
