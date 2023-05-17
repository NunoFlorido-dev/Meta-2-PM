class Botao{
  PVector cords;
  int alt, larg;
  String text;
  color fundo, texto;
  Botao(PVector cords1, color c1, color c2, String text1, int a, int b){
    cords=cords1;
    alt=a;
    larg=b;
    fundo=color(c1);
    texto=color(c2);
    text=text1;
  }
  boolean colide(){
    if(dist(mouseX,0,cords.x,0)<larg/2 && dist(mouseY,0,cords.y,0)<alt/2){
      return true;
    }else{
      return false;
    }
  }
  void desenha(){
   rectMode(CENTER);
    fill(fundo);
    if(colide()==true){
      rect(cords.x,cords.y,larg+5,alt+5);
    }else{
      rect(cords.x,cords.y,larg,alt);
    }
    textSize(int(alt/3));
    fill(texto);
    text(text,cords.x,cords.y+alt/6);
    rectMode(CORNER);
  }
}
