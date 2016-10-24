Grid grid;
void setup() {
  size(1400, 1000);
  background(10);
  grid = new Grid();
}

void draw() {
  background(10);
  grid.display();
}
void mouseClicked() { 
  //if(!grid.START)
  if(mouseButton == LEFT)
    grid.startFIRE();
  else if(mouseButton == RIGHT)
    grid.extinguish();
}