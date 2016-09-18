class Pond {
  Bubble b;
  ArrayList<Bubble> bub = new ArrayList<Bubble>();
  Pond() {
    bub.add(new Bubble());
  }
  void display() {
    //background(150,230,250);
    for(int i = 0; i < bub.size(); i++) {
      bub.get(i).display();
      if(bub.get(i).gone) bub.remove(b);
    }
    createBubbles();
  }
  void createBubbles() {
    float f = random(0,100);
    if(f < 2)
      bub.add(new Bubble());
  }
}