class Contour {
  ArrayList<PVector> vec;
  int r,g,b,f;
  color col;
  Contour(PVector p) {
    vec = new ArrayList();
    vec.add(new PVector(p.x, p.y));
    r = int(random(0,200));
    g = int(random(0,200));
    b = int(random(0,200));
    f = 50;
    col = color(r,g,b,f);
  }
  Contour(PVector p, int r, int g, int b) {
    vec = new ArrayList();
    vec.add(new PVector(p.x, p.y));
    r = r + int(random(0,30));
    g = g + int(random(0,30));
    b = b + int(random(0,30));
    f = 100;
    col = color(r,g,b,f);
  }
  void draw() {
    fill(col);
    beginShape();
    for(PVector v : vec) 
      vertex(v.x, v.y);
    endShape(CLOSE); 
  }
  void addVert(PVector p) {
    vec.add(p); 
  }
  int getSize() {
    return vec.size();
  }
}