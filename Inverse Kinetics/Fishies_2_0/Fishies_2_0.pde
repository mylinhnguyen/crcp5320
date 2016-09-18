Skeleton s, t;
Pond p;
void setup() {
  size(1200,800);
  s = new Skeleton();
  p = new Pond();
  frameRate(60);
}

void draw() {
  background(150);
  p.display();
  s.display();
}