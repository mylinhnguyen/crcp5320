class Pond {
  Bubble b;
  Skeleton s;
  PImage border;
  ArrayList<Bubble> bub = new ArrayList<Bubble>();
  Pond() {
    border = loadImage("plants.png");
    //border.resize(1200,800);
    s = new Skeleton();
    bub.add(new Bubble());
  }
  void display() {
    background(145,200,200);
    image(border,0,0);
    //background(bottom);
    s.display();
    for(int i = 0; i < bub.size(); i++) {
      bub.get(i).display();
      if(bub.get(i).gone) bub.remove(b);
    }
    createBubbles();
    plants();
  }
  void plants() {
    noStroke();
    fill(50,130,50);
    rect(0,0,50,50);
  }
  void createBubbles() {
    float f = random(0,100);
    if(f < 2)
      bub.add(new Bubble());
  }
}