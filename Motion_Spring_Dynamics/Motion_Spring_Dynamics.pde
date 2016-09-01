Butterfly b;
void setup() {
  size(1200,800);
  b = new Butterfly();
}

void draw() {
  //background(100,200,250);
  b.display();
  b.move();
}