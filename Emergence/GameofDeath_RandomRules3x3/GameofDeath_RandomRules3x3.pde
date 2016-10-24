Grid grid;
void setup() {
  size(500,500);
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
void keyPressed() {
  grid.keyPressed(); 
}