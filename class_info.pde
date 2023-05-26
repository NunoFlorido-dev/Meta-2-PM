class Info {
  MenuMeta1 menu;
  float x, y, w, h;
  
  
  Info(boolean ativaMusica) {
    menu=new MenuMeta1(ativaMusica);
    w = 400;
    h = 400;
    x = width/2-w/2;
    y = height/2-h/2;
  }
  
  
  void display() {
    String selectI = "Select Image";
    String selectM = "Select Music";
    String notice = "ALERTA!";
    String infoI = "Selecionar a imagem a manipular";
    String infoM = "Selecionar a música a se ouvir";
    String[] note = new String[2];
    
    note[0] = "O visualizador só funciona se se";
    note[1] = "inserir tanto a música como a imagem!";
    fill(0, 0, 100);
    rect(x, y, w, h);
    fill(0);
    
    text(selectI, x+(textWidth(selectI)/2)+20, y+40);
    text(selectM, x+(textWidth(selectM)/2)+20, y+120);
    text(infoI, (x+w)-(textWidth(infoI)/2)-20, y+40);
    text(infoM, (x+w)-(textWidth(infoM)/2)-20, y+120);
    fill(0, 70, 100);
    
    textAlign(CENTER);
    rect(x, y+200, w, h-280);
    fill(100, 0, 0);
    text(notice, x+w/2, y+230);
    text(note[0], x+w/2, y+260);
    text(note[1], x+w/2, y+280);
    text("Diverte-te!",x+w/2,y+350);
    text("Remove este alerta ao carregar no rato",x+w/2,y+370);
  }
}
