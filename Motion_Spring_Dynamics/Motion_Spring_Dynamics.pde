Habitat h;
Butterfly b;
PImage sky;

void setup() {
  size(1200,800);
  b = new Butterfly(.5, .5); //tester
  h = new Habitat();
}

void draw() {
  h.display();
  h.run();
  b.display();
  b.move();
}