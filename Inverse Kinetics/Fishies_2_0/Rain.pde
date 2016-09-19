class Rain {
  PVector floc, bloc, eloc;
  float len;
  color col;
  boolean left = false, right = false, up = false, down = false, center = false;
  boolean fallen = false;
  Rain() {
    //loc somewhere offscreen
    //bloc angled maybe depending on where eloc is generated
    //eloc generated within region
    col = color(150);
    len = random(10,20);
  }
  void display() {
    stroke(col);
    line(floc.x, floc.y, bloc.x , bloc.y);
  }
  void fall() {
    //floc.x-something or floc.x + something
    
  }
}