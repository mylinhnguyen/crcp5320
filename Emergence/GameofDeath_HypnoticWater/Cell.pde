//Difference is randGrowthWATER's value higher than usual:
//from random(0.01,0.05);
class Cell {
  PVector loc;
  color onColWATER, offCol, curCol;
  Boolean offon;
  float lifeWATER, randGrowthWATER;
  int num;
  
  Cell(PVector l, int n) {
    loc = l;
    num = n;
    offon = false;
    onColWATER = color(70,70,250);
    curCol = offCol = color(10,10,10);
    lifeWATER = 0.0;
    randGrowthWATER = random(0.01,0.05);
  }
  void display() {
    noStroke();
    fill(curCol);
    rect(loc.x, loc.y, 5, 5);
    //ellipse(loc.x, loc.y, 5, 5);
    changeCol();
  }
  void setStateON() {
    curCol = onColWATER;
    offon = true;
  }
  void setStateOFF() {
    curCol = offCol;
    offon = false;
    lifeWATER = 0;
  }
  int getNum() {
    return num; 
  }
  void changeCol() {
    if(offon) {
      curCol = lerpColor(onColWATER, offCol, lifeWATER);
      if(lifeWATER > 1.0) setStateOFF();
      else lifeWATER+=randGrowthWATER;
    }
  }
}