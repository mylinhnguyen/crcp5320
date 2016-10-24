class Grid {
  ArrayList<Cell> grid = new ArrayList();
  Boolean allOFFON, START;
  float chance;
  float[] chances = new float[4];
  
  Grid() {
    START = allOFFON = false;
    chance = 5;
    chances[0] = 50;
    chances[1] = 50;
    chances[2] = 50;
    chances[3] = 50;
    for(int y = 0, n = 0; y < height; y+=5) {
      for(int x = 0; x < width; x+=5) {
        grid.add(new Cell(new PVector(x, y), n));
        n++;
      }
    }
  }
  void display() {
    for(Cell c: grid)
      c.display();
    spreadWATER();
  }
  void spreadWATER() {
    if(START) {
      for(Cell c: grid) {
        if(c.loc.x <= 0 || c.loc.x >= width-5 || c.loc.y <= 0 || c.loc.y >= height-5) {
          //do something special for borders?
        }
        else if(c.offon) {
          //check up,down,left,right 
          float r = random(100);
          if(!grid.get(getAbove(c)).offon && r <= chances[0]) {
            grid.get(getAbove(c)).setStateON();
          }
          else if(!grid.get(getBelow(c)).offon && r <= chances[1]) {
            grid.get(getBelow(c)).setStateON();
          }
          else if(!grid.get(getLeft(c)).offon && r <= chances[2]) {
            grid.get(getLeft(c)).setStateON();
          }
          else if(!grid.get(getRight(c)).offon && r <= chances[3]) {
            grid.get(getRight(c)).setStateON();
          }
        }
      }
    }
  }
  void activateALL() {
    allOFFON = true;
    for(Cell c: grid)
      c.setStateON();
  }
  void startWATER() {
    grid.get(grid.size()/2+140).setStateON();
    if(!START)
      START = true;
  }
  int getAbove(Cell c) {
    return c.num-100;
  }
  int getBelow(Cell c) {
    return c.num+100;
  }
  int getLeft(Cell c) {
    return c.num-1;
  }
  int getRight(Cell c) {
    return c.num+1;
  }
  void reset() {
    for(Cell c: grid) {
      c.setStateOFF(); 
    }
  }
}