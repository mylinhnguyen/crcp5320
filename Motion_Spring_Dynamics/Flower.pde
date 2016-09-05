class Flower {
  PVector base_loc, top_stem;
  PVector speed;
  color col, other;
  int petal_size, scent_radius, size, lifespan;
  boolean isDead, eaten;
  Flower() {
    //base_loc a little past bottom of screen
    //top_stem can vary
    //color random
    base_loc = new PVector(random(100,1100), random(50) + height);
    size = int(random(150,300));
    top_stem = new PVector(base_loc.x, base_loc.y - size);
    isDead = eaten = false;
    col = color(random(250),random(250),random(250));
    scent_radius = int(random(5,200));
  }
  Flower(color c, int sr) {
    base_loc = new PVector(random(100,1100), random(50) + height);
    size = int(random(150,300));
    top_stem = new PVector(base_loc.x, base_loc.y - size);
    isDead = eaten = false;
    col = c;
    scent_radius = sr;
  }
  Flower(PVector l, color c, int sr) {
    base_loc = l;
    size = int(random(150,300));
    top_stem = new PVector(base_loc.x, base_loc.y - size);
    isDead = eaten = false;
    col = c;
    scent_radius = sr;
  }
  void display() {
    strokeWeight(3);
    stroke(100,200,100);
    line(base_loc.x, base_loc.y, top_stem.x, top_stem.y);
    noStroke();
    fill(col);
    ellipse(top_stem.x, top_stem.y, 40, 40);
    fill(250,250,50);
    ellipse(top_stem.x, top_stem.y, 20, 20);
  }
  void move() {
    //sway
  }
  void eaten() {
    eaten = true; 
  }
  color getColor() {
    return col; 
  }
  color getColorOther() {
    return other; 
  }
  void giveColor(color c) {
    other = c; 
  }
  int getScentRadius() {
    return scent_radius;
  }
  void dead() {
    //when lifespan in seconds is 0, dies
  }
}