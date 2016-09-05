class Flower {
  PVector base_loc, top_stem;
  PVector speed;
  color col, other;
  int petal_size, scent_radius, size;
  boolean isDead, eaten;
  Flower() {
    //base_loc a little past bottom of screen
    //top_stem can vary
    //color random
    base_loc = new PVector(random(100,1100), random(50) + height);
    size = int(random(100,300));
    isDead = eaten = false;
    col = color(random(250),random(250),random(250));
  }
  Flower(color c) {
    base_loc = new PVector(random(100,1100), random(50) + height);
    size = int(random(100,300));
    isDead = eaten = false;
    col = c;
  }
  void display() {
    strokeWeight(3);
    stroke(100,200,100);
    line(base_loc.x, base_loc.y, base_loc.x, base_loc.y - size);
    noStroke();
    fill(250,250,50);
    ellipse(base_loc.x, base_loc.y - size, 20, 20);
  }
  void move() {
    //sway
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
  void dead() {
    
  }
}