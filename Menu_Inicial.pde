class MenuIn extends Menu {
  color back;
  PVector cordsBotaoPlay= new PVector(width/2, height/2-20);
  PVector cordsBotaoLoadMusic=new PVector(width/2, height/2+80);
  Botao [] Botao;
  Botao startBotao, LoadMusic;
  MenuIn(color c1, color c2) {
    super(c1, c2);
    back=color(c1);
    Botao=new Botao[2];
    //Botao 0: Botao de start, Botao 1: botoa de load Music
    Botao[0]= new Botao(cordsBotaoPlay, color(c1), color(0), ">",
      70, 250);
    Botao[1]= new Botao(cordsBotaoLoadMusic, color(c1), color(0),
      "Descarregar Musica", 70, 250);
  }
  void desenho() {
    background(color(0));
    Botao[0].desenha();
    Botao[1].desenha();
  }
  boolean colideBotao(int a) {
    if (Botao[a].colide()==true) {
      return true;
    } else {
      return false;
    }
  }
}
