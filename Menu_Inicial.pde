class MenuIn extends Menu{
  color back;
  PVector cordsBotaoPlay= new PVector(width/2,height/2-20);
  PVector cordsBotaoLoadMusic=new PVector(width/2,height/2+80);
  Botao startBotao, LoadMusic;
  MenuIn(color c1, color c2){
    super(c1,c2);
    back=color(c1);
    startBotao= new Botao(cordsBotaoPlay,color(c1),color(0),">",70,250);
    LoadMusic= new Botao(cordsBotaoLoadMusic,color(c1),color(0),"Descarregar Musica",70,250);
  }
  void desenho(){
    background(color(0));
    startBotao.desenha();
    LoadMusic.desenha();
  }
}
