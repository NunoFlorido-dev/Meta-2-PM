class Menu{
  color fundo;
  color letras;
  boolean ShowSondAmp;
  Botao[] Botao;
    boolean colideBotao(int a){
    if(Botao[a].colide()==true){
      return true;
    }else{
      return false;
    }
  }
  Menu(color c1, color c2){
    fundo=color(c1);
    fundo=color(c2);
  }
  void desenho(){
  }
  void jumpMusic(){
  }
  void choseAmp(){
  }
  
}
