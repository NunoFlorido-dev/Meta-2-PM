class ArcSystem {
  ArrayList<Arco>arcos;
  ArcSystem() {
    arcos=new ArrayList<Arco>();
  }
  void addArco() {
    arcos.add(new Arco());
  }
  void run() {
    for (int i=arcos.size()-1; i>=0; i--) {
      Arco a=arcos.get(i);
      a.update();
      a.display();
      if (a.isDead()) {
        arcos.remove(i);
      }
    }
  }
}
