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
  void run() {
    for(int i = 0; i < b_num; i++) {
      for(int j = 0; j < f_num; j++) {
        if(inRange(bb[i], ff.get(i)) && !ff.get(i).eaten) {
          //butterfly becomes flower color if doesn't have one
          bb[i].eat(ff.get(i).col);
          ff.get(i).eaten();
          offspring(ff.get(i));
        }
      }
    }
  }
  boolean inRange(Butterfly b, Flower f) {
    //change bb omega/amp and calc distance something something
    if(dist(b.loc.x, b.loc.y, f.top_stem.x, f.top_stem.y) <= b.detect_radius
    && dist(b.loc.x, b.loc.y, f.top_stem.x, f.top_stem.y) <= f.scent_radius)
      return true;
    return false;
  }
  void offspring(Flower f) {
    int s = f.getScentRadius();
    int ns = int(randomGaussian()) + s;
    color c1 = f.getColor();
    color c2, c3;
    if(f.eaten) {
      c2 = f.getColorOther();
      c3 = c1 + c2;
    }
    else c3 = c1;
    PVector loc = new PVector(randomGaussian() * 30 + f.base_loc.x, randomGaussian() * 30 + f.base_loc.y);
    ff.add(new Flower(loc, c3, ns));
  }
  void newFlower(Flower f) {
    int s = f.getScentRadius();
    int ns = int(randomGaussian()) + s;
    color c1 = f.getColor();
    color c2, c3;
    if(f.eaten) {
      c2 = f.getColorOther();
      c3 = c1 + c2;
    }
    else c3 = c1;
    ff.remove(f);
    ff.add(new Flower(c3, ns));
  }
  void randomNewFlower(Flower f) {
    ff.remove(f);
    ff.add(new Flower());
  }
}