Habitat h;
Butterfly b;
void setup() {
  size(1200,800);
  b = new Butterfly(.5, .5); //tester
  h = new Habitat();
}

void draw() {
  background(150,220,250);
  h.display();
  b.display();
  b.move();
}