class Pond {
  Bubble b;
  Skeleton s;
  ArrayList<Bubble> bub = new ArrayList<Bubble>();
  Pond() {
    s = new Skeleton();
    bub.add(new Bubble());
  }
  void display() {
    background(145,200,200);
    s.display();
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