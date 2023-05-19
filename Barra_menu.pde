class BarraMenu extends MenuVis2 {
  color fundo;
  color nFundo;
  Botao MusicPos;
  Botao AmpSom;
  Botao [] Botao;
  SoundFile music;
  PVector cordsMusic= new PVector(100, 19*height/20);
  PVector cordsAmp= new PVector(width-50, height-150);
  PVector cordsSom= new PVector(width-50, 19*height/20);
  PVector cordsPause= new PVector(width/2, height-60);
  PVector cordsBack= new PVector(50,19*height/20);
  boolean ShowSondAmp=false;
  String stopPause= "| |";
  boolean MenuOP() {
    if (mouseY>height-height/10) {
      return true;
    } else {
      return false;
    }
  }
  BarraMenu(color c1, color c2, SoundFile music) {
    super(c1, c2);
    this.music = music;
    fundo=color(c1);
    nFundo=color(255-red(fundo), 255-green(fundo), 255-blue(fundo));
    Botao= new Botao[3];
    MusicPos= new Botao(cordsMusic, color(nFundo),
      color(0), "", 30, 20);
    AmpSom= new Botao(cordsAmp, color(nFundo), color(0), "", 15, 20);
    //btao 0 = som Botao 1= pause
    Botao[0]=new Botao(cordsSom, color(0), color(0), "", 20, 20);
    Botao[1]= new Botao (cordsPause, color(0), color(nFundo),stopPause, 20, 20);
    Botao[2]= new Botao(cordsBack, color(0),color(nFundo),"<-",20,80);
  }
  void desenho() {
    if (MenuOP()==true || ShowSondAmp==true) {
      float pos= map(music.position(), 0, music.duration(), 100, width-100);
      rectMode(CORNER);
      fill(fundo);
      rect(0, 9*height/10, width, height/10);
      fill(0);
      rect(100, 19*height/20, width-200, 15);
      fill(fundo);
      MusicPos.cords.x=pos;
      MusicPos.desenha();
      for(int i=0; i<3; i++){
      Botao[0].desenha();
      Botao[1].desenha();
       Botao[2].desenha();
      if (music.isPlaying()==true) {
        Botao[1].text="| |";
      } else {
        Botao[1].text=">";
      }
    }
  }
  }
  void choseAmp() {
    fill(fundo);
    rect(width-70, height-160, 40, 70);
    fill(0);
    rect(width-55, height-150, 10, 50);
    AmpSom.desenha();
    if (AmpSom.colide()) {
      if (mousePressed) {
        if (mouseY<height-100 && mouseY>height-150) {
          AmpSom.cords.y=mouseY;
          music.amp(map(mouseY, height-100, height-150, 0, 1));
        }
      }
    }
  }
  void jumpMusic() {
    int segs=int(music.position())%60;
    int mins=int(music.position()/60);
    if (MusicPos.colide()) {
      rect(mouseX-15, mouseY-25, 30, 15);
      textSize(15);
      fill(255);
      text(mins+"."+segs, mouseX-10, mouseY-10);
    }
    if(mouseX>100 && mouseX< width-100 && mouseY> 19*height/20 && mouseY<19*height/20+15){
      if (mousePressed) {
        float pos= map(mouseX, 100, width-100, 0, music.duration());
        music.jump(pos);
      }
    }
  }
  boolean colideBotao(int a) {
    if (Botao[a].colide()==true) {
      return true;
    } else {
      return false;
    }
  }
}
