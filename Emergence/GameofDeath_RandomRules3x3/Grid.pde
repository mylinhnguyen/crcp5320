class Grid {
  ArrayList<Cell> grid = new ArrayList();
  Boolean allOFFON, START;
  float[] chances = new float[8];
  int[] rule = new int[8];
  int rSize;
  
  Grid() {
    START = allOFFON = false;
    chances[0] = random(12.5); //up
    chances[1] = random(12.5); //down
    chances[2] = random(12.5); //left
    chances[3] = random(12.5); //right
    chances[4] = random(12.5); //above left
    chances[5] = random(12.5); //above right
    chances[6] = random(12.5); //below left
    chances[7] = random(12.5); //below right
    rule[0] = int(random(0,1));
    rule[1] = int(random(0,1));
    rule[2] = int(random(0,1));
    rule[3] = int(random(0,1));
    rule[4] = int(random(0,1));
    rule[5] = int(random(0,1));
    rule[6] = int(random(0,1));
    rule[7] = int(random(0,1));
    rSize = int(random(1,10));
    println(rSize);
    for(int y = 0, n = 0; y < height; y+=rSize) {
      for(int x = 0; x < width; x+=rSize) {
        grid.add(new Cell(new PVector(x, y), n, rSize));
        n++;
      }
    }
  }
  void display() {
    for(Cell c: grid)
      c.display();
    growForest();
    affectOthersFIRE();
  }
  void growForest() {
    for(Cell c: grid) {
      float r = random(100);
      if(!c.offon && !c.TREE && r <= 0.5) c.setStateGROW(); 
    }
  }
  void affectOthersFIRE() {
    if(START) {
      for(Cell c: grid) {
        if(c.loc.x <= 0 || c.loc.x >= width-rSize || c.loc.y <= 0 || c.loc.y >= height-rSize) {
          //do something special for borders?
        }
        else if(c.offon) {
          //check up,down,left,right 
          float r = random(100);
          if(grid.get(getAbove(c)).offon == boolean(rule[0]) && r <= chances[0]) {
            grid.get(getAbove(c)).setStateON();
          }
          else if(grid.get(getBelow(c)).offon == boolean(rule[1]) && r <= chances[1]) {
            grid.get(getBelow(c)).setStateON();
          }
          else if(grid.get(getLeft(c)).offon == boolean(rule[2]) && r <= chances[2]) {
            grid.get(getLeft(c)).setStateON();
          }
          else if(grid.get(getRight(c)).offon == boolean(rule[3]) && r <= chances[3]) {
            grid.get(getRight(c)).setStateON();
          }
          else if(grid.get(getAboveLeft(c)).offon == boolean(rule[4]) && r <= chances[4]) {
            grid.get(getAboveLeft(c)).setStateON();
          }
          else if(grid.get(getAboveRight(c)).offon == boolean(rule[5]) && r <= chances[5]) {
            grid.get(getAboveRight(c)).setStateON();
          }
          else if(grid.get(getBelowLeft(c)).offon == boolean(rule[6]) && r <= chances[6]) {
            grid.get(getBelowLeft(c)).setStateON();
          }          
          else if(grid.get(getBelowRight(c)).offon == boolean(rule[7]) && r <= chances[7]) {
            grid.get(getBelowRight(c)).setStateON();
          }
          /*
          //check all sides to see if any trees around
          //if not, fire dies off
          if(!grid.get(getAbove(c)).TREE && !grid.get(getBelow(c)).TREE 
          && !grid.get(getLeft(c)).TREE && !grid.get(getRight(c)).TREE
          && !grid.get(getAboveLeft(c)).TREE && !grid.get(getAboveRight(c)).TREE
          && !grid.get(getBelowLeft(c)).TREE && !grid.get(getBelowRight(c)).TREE) {
             c.spread = false;
          }
          */
        }
      }
    }
  }
  void activateALL() {
    allOFFON = true;
    for(Cell c: grid)
      c.setStateON();
  }
  void startFIRE() {
    int r = int(random(0,grid.size()-1));
    Cell c = grid.get(r);
    c.setStateON();
    START = true;
  }
  void extinguish() {
    for(Cell c: grid) {
      if(c.offon)
        c.setStateOFF();
    }
  }
  void keyPressed() {
    if(keyCode == 32) {
      chances[0] = random(12.5); //up
      chances[1] = random(12.5); //down
      chances[2] = random(12.5); //left
      chances[3] = random(12.5); //right
      chances[4] = random(12.5); //above left
      chances[5] = random(12.5); //above right
      chances[6] = random(12.5); //below left
      chances[7] = random(12.5); //below right 
    }
  }
  int getAbove(Cell c) {
    return c.num-width/rSize; //280
  }
  int getBelow(Cell c) {
    return c.num+width/rSize;
  }
  int getLeft(Cell c) {
    return c.num-1;
  }
  int getRight(Cell c) {
    return c.num+1;
  }
  int getAboveRight(Cell c) {
    return c.num-(width/rSize) + 1;
  }
  int getAboveLeft(Cell c) {
    return c.num-(width/rSize) - 1; 
  }
  int getBelowRight(Cell c) {
    return c.num+(width/rSize) + 1; 
  }
  int getBelowLeft(Cell c) {
    return c.num+(width/rSize) - 1;
  }
}