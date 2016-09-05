class Habitat {
  Butterfly[] bb;
  ArrayList<Flower> ff = new ArrayList();
  int b_num, f_num;
  Habitat() {
    b_num = 10;
    f_num = 20;
    bb = new Butterfly[b_num];
    for(int j = 0; j < f_num; j++)
      ff.add(new Flower());
    for(int i = 0; i < b_num; i++) 
      bb[i] = new Butterfly();
  }
  Habitat(int b) {
    b_num = b; 
    f_num = 20;
    bb = new Butterfly[b_num];
    for(int j = 0; j < f_num; j++)
      ff.add(new Flower());
    for(int i = 0; i < b_num; i++) 
      bb[i] = new Butterfly();
  }
  void display() {
    for(Flower f : ff) 
      f.display();
    for(int i = 0; i < b_num; i++) {
      bb[i].display();
      bb[i].move();
    }
  }
  boolean inRange(Butterfly b, Flower f) {
    //change bb omega/amp and calc distance something something
    return false;
  }
  void newFlower(Flower f) {
    color c1 = f.getColor();
    color c2, c3;
    if(f.eaten) {
      c2 = f.getColorOther();
      c3 = c1 + c2;
    }
    else c3 = c1;
    ff.remove(f);
    ff.add(new Flower(c3));
  }
  void randomNewFlower() {
    
  }
}