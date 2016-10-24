Grid grid;
int count;
void setup() {
  size(500,500);//500,500
  background(10);
  grid = new Grid();
  count = 0;
  grid.startWATER();
}

void draw() {
  background(10);
  grid.display();
  count++;
  if(count == 100) {
    count = 0;
    grid.startWATER();
  }
}
void mouseClicked() {
  grid.reset();
}