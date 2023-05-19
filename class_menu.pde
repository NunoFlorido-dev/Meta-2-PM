class MenuMeta1 {
  //variáveis do menu
  boolean menuativa;
  color cormenu, cormenuA, cormenuB, cormenuC, black, white, corFundo, corFundoA, corFundoB, corFundoC;
  color red, green, blue;
  PImage imgplay, imgstop, imgmais, imgmenos;
  float posX, posY, lineX;
  int lineW, circleX, menuW, imageSize1, imageSize2, circleRaio;
  boolean ativaMusica;
  MenuMeta1(boolean ativaMusica) {
    this.ativaMusica = ativaMusica;
    //inicialização das variáveis dos elementos do menu
    lineW=175;
    circleX=100;
    menuW=200;
    imageSize1=45;
    imageSize2=20;
    circleRaio=10;
    //cores do menu
    cormenuA=color(0, 40, 100);
    cormenuB=color(120, 40, 100);
    cormenuC=color(240, 40, 100);
    corFundoA=color(0, 20, 100);
    corFundoB=color(120, 15, 100);
    corFundoC=color(240, 20, 100);
    corFundo=corFundoA;
    cormenu=cormenuA;
    black=color(0, 0, 0);
    white=color(0, 0, 100);
    //cores dos botões
    red=color(0, 100, 100);
    green=color(120, 100, 100);
    blue=color(240, 100, 100);
  }
  //função que dá load às imagens
  void loadImg() {
    //load às imagens do menu
    imgplay=loadImage("play.png");
    imgstop=loadImage("pause.png");
    imgmais=loadImage("plus.png");
    imgmenos=loadImage("minus.png");
  }
  //booleans que detetam a posição do rato nos elementos do menu
  boolean insideReturn() {
    if (mouseX>(menuW/2)-75 && mouseX<(menuW/2)+75 &&
      mouseY>(height-150)-15 && mouseY<(height-150)+15) {
      return true;
    } else {
      return false;
    }
  }
  boolean insideImage() {
    if (mouseX>(menuW/2)-75 && mouseX<(menuW/2)+75 &&
      mouseY>(height-100)-15 && mouseY<(height-100)+15) {
      return true;
    } else {
      return false;
    }
  }
  boolean insideMusic() {
    if (mouseX>(menuW/2)-75 && mouseX<(menuW/2)+75 &&
      mouseY>(height-50)-15 && mouseY<(height-50)+15) {
      return true;
    } else {
      return false;
    }
  }
  boolean visPos() {
    if (mouseY>230 && mouseY<250 && mouseX>25 && mouseX<lineW) {
      return true;
    } else {
      return false;
    }
  }
  boolean dentroPausa() {
    if (mouseX>100-imageSize1/2 && mouseX<100+imageSize1/2 &&
      mouseY>180-imageSize1/2 && mouseY<180+imageSize1/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean dentroPlay() {
    if (mouseX>102-imageSize1/2 && mouseX<102+imageSize1/2
      && mouseY>94-imageSize1/2 && mouseY<94+imageSize1/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean dentroRed() {
    if (dist(circleX-50, 280, mouseX, mouseY)<circleRaio/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean dentroBlue() {
    if (dist(circleX+50, 280, mouseX, mouseY)<circleRaio/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean dentroGreen() {
    if (dist(circleX, 280, mouseX, mouseY)<circleRaio/2) {
      return true;
    } else {
      return false;
    }
  }
  void chooseVis(){
    if(insideReturn()){
     visNum = 0;
    }
  }
  void display() {
    //função que dá load às imagens do menu
    loadImg();
    //boolean que ativa o menu
    if (mouseX<20) {
      menuativa=true;
    } else if
      (mouseX>200) {
      menuativa=false;
    }
    //se o menu for ativado
    if (menuativa) {
      //rect
      noStroke();
      fill(cormenu);
      rect(0, 0, menuW, height);
      //circulos da cor
      fill(blue);
      circle(circleX+50, 280, circleRaio);
      fill(red);
      circle(circleX-50, 280, circleRaio);
      fill(green);
      circle(circleX, 280, circleRaio);
      //assets do player
      image(imgplay, 102, 94, imageSize1, imageSize1);
      image(imgstop, 100, 180, imageSize1, imageSize1);
      //image(imgmais, 130, 330, imageSize2, imageSize2);
      //image(imgmenos, 70, 330, imageSize2, imageSize2);
      //visualizador da pos
      stroke(black);
      strokeWeight(2);
      line(25, 240, lineW, 240);
      //circulo da pos
      if (ativaMusica==true) {
        noStroke();
        fill(white);
        circle(lineX, 240, 10);
        strokeWeight(2);
        stroke(white);
        line(25, 240, lineX, 240);
      }
      //barras de input da imagem e música
      noStroke();
      fill(white);
      rect(25, height-165, 150, 30);
      rect(25, height-115, 150, 30);
      rect(25, height-65, 150, 30);
      fill(black);
      //texto do menu
      text("Choose Vis", menuW/2, height-145);
      text("Select Image", menuW/2, height-95);
      text("Select Music", menuW/2, height-45);
    }
  }
}
