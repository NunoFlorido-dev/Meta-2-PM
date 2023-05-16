class Visualizador1 {
  //classe
  MenuMeta1 menu;
  AltImage altImage;
  Info info;
  //imagem e música
  PImage img;
  SoundFile musica;
  //amplitude da música
  Amplitude amp;
  //fft
  FFT fft;
  //valores da cor
  float h, s, b;
  //beats
  BeatDetector beat;
  //volume
  float volume;
  //fonte
  PFont fonte;
  //número da versão
  //booleans referentes ao input da música e da imagem *OBRIGATÓRIAS PARA QUASE TODO O CÓDIGO*
  boolean ativaMusica;
  boolean ativaImagem;
  boolean paraMusica;
  boolean removeNotice;
  Visualizador1() {
    imageMode(CENTER);
    textAlign(CENTER);
    textSize(16);
    colorMode(HSB, 360, 100, 100);
    ativaMusica=false;
    ativaImagem=false;
    paraMusica=true;
    removeNotice=true;
    menu=new MenuMeta1(ativaMusica);
    altImage= new AltImage();
    info=new Info(ativaMusica);
    amp=new Amplitude(Meta_2.this);
    beat=new BeatDetector(Meta_2.this);
    fft= new FFT(Meta_2.this, 8);
  }

  void imageSelected(File imageFile) {
    if (imageFile == null) {
      println("No image selected");
    } else {
      println("Selected image:" + imageFile.getAbsolutePath());
      img = loadImage(imageFile.getAbsolutePath());
      //ativa a imagem
      ativaImagem = true;
    }
  }

  void musicSelected(File musicFile) {
    if (musicFile == null) {
      println("No music selected");
    } else {
      println("Selected music:" + musicFile.getAbsolutePath());
      musica = new SoundFile(Meta_2.this, musicFile.getAbsolutePath());
      //começa a música
      ativaMusica = true;
      if (ativaMusica == true) {
        fft.input(musica);
        amp.input(musica);
        beat.input(musica);
        if (ativaImagem==true) {
          musica.play();
        }
      }
    }
  }
  void displayVis() {
    println(altImage.nVersão);
    background(menu.corFundo);
    if (removeNotice==true) {
      info.display();
    }
    //inicialização da variável da barra
    float xl;
    //se a imagem está ativada, a imagem é transformada e ela aparece
    if (ativaImagem==true) {
      //se a música está ativada, a imagem é transformada
      if (ativaMusica==true) {
        //inicialização das variáveis do som
        float[] espectro=fft.analyze();
        float a=amp.analyze();
        //variável da barra
        xl=map(musica.position(), 0, musica.duration(),
          width/2-(img.width/2), width/2+(img.width/2));
        //x da barra do menu
        menu.lineX=map(musica.position(), 0, musica.duration(), 25, menu.lineW);
        for (int x = 0; x < img.width; x++) {
          for (int y = 0; y < img.height; y++) {
            int loc = x + y * img.width;
            //mapeamento do x da barra
            float xfor=map(xl, width/2-img.width/2, width/2+img.width/2, 0, img.width);
            fill(40, 50, 70);
            if (xfor>x-10 && xfor<x) {
              int t=int(map(x, 0, img.width, 0, 360));
              altImage.getvar(loc, y, x, xfor, a, t, img);
              if (altImage.nVersão==1) {
                altImage.versão1(img);
              } else if (altImage.nVersão==2) {
                altImage.versão2(img, beat);
              } else if (altImage.nVersão==3) {
                altImage.versão3(espectro[0], espectro[1], espectro[3], espectro[2], img);
              } else if (altImage.nVersão==4) {
                altImage.versão4(espectro[2], espectro[5], img, beat);
              } else if (altImage.nVersão==5) {
                altImage.versão5(espectro[int(a*8)], 
                espectro[7], espectro[1], espectro[5], espectro[2], img, beat);
              } else if (altImage.nVersão==6) {
                altImage.versão6(img);
              }
            }
          }
        }
      }
      altImage.desenha(img);
    }
    if (ativaImagem==true) {
      if (ativaMusica==true) {
        xl=map(musica.position(), 0, musica.duration(), width/2-(img.width/2), width/2+(img.width/2));
        stroke(0);
        strokeWeight(10);
        line(xl, 0, xl, height);
        //println(xl);
      }
    }
    //display do menu
    menu.display();
  }
  void mousePressed() {
    if (removeNotice==true) {
      removeNotice=false;
    }
    //booleans dos respetivos elementos do menu e o que ocorre se se premir o rato
    if (menu.menuativa==true) {
      //mudança da cor do menu
      if (menu.dentroRed()) {
        menu.cormenu=menu.cormenuA;
        menu.corFundo=menu.corFundoA;
      }
      if (menu.dentroGreen()) {
        menu.cormenu=menu.cormenuB;
        menu.corFundo=menu.corFundoB;
      }
      if (menu.dentroBlue()) {
        menu.cormenu=menu.cormenuC;
        menu.corFundo=menu.corFundoC;
      }
      if (menu.insideImage()) {
        selectInput("Select an image file to open:", "imageSelected");
      }
      if (menu.insideMusic()) {
        selectInput("Select a music file to open:", "musicSelected");
      }
      if (ativaMusica) {
        if (menu.dentroPausa()) {
          if (musica.isPlaying()) {
            musica.pause();
            paraMusica=false;
          }
        }
        if (menu.dentroPlay()) {
          if (!musica.isPlaying()) {
            musica.play();
            paraMusica=true;
          }
        }
        if (menu.visPos()) {
          float newStart=map(mouseX, 25, menu.lineW, 0, musica.duration());
          musica.stop();
          musica.cue(newStart);
          //se é verdade, a musica continua a dar, senão, pára
          if (paraMusica==true) {
            musica.play();
          } else {
            musica.pause();
          }
        }
        if(ativaImagem){
          if(altImage.insideTheImage(img)){
           img.save("modified_image");}}
      }
    }
  }
  void keyPressed() {
    // Escolher versão do visualizador
    int version = key - '0'; 
    if (version >= 1 && version <= 6) {
      altImage.nVersão = version;
    }
  }
}
