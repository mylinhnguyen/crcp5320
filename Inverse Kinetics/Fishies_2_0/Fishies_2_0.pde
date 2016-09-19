Skeleton s, t;
Pond p;
void setup() {
  size(1200,800);
  
  p = new Pond();
  frameRate(60);
}

void draw() {
  //background(150);
  p.display();
  
}