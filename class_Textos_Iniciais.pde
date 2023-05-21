class StartTexts{
  String[] linhas;
  float[] cordsY;
  StartTexts(){
    linhas= loadStrings("texto PM.txt");
    cordsY= new float[linhas.length];
    for(int i=0; i<linhas.length; i++){
      cordsY[i]=i*30;
    }
  }
  void desenho(){
    for(int i=0; i<linhas.length; i++){
      float add= map(cordsY[i], 0,height,0,1.5);
      cordsY[i]=cordsY[i]+1.5+add;
      if(cordsY[i]>height){
        cordsY[i]=0;
      }
    }
    background(0);
    fill(255);
    for( int linha=0; linha<linhas.length; linha++){
      textSize(map(cordsY[linha],0,height,20,40));
    text(linhas[linha],width/2,cordsY[linha]);
    }
}
}
