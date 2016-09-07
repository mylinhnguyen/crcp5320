class Flower {
  PVector base_loc, top_stem;
  PVector speed;
  color col, other;
  int petal_size, scent_radius, size, lifespan, offspring;
  PVector sway;
  boolean isDead, eaten;
  Timer t;
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
    lifespan = int(random(120,200));
    t = new Timer(int(random(30,60)));
    offspring = 1;
    sway = new PVector(random(.03,.07), random(.01,.04));
  }
  Flower(color c, int sr) {
    base_loc = new PVector(random(100,1100), random(50) + height);
    size = int(random(150,300));
    top_stem = new PVector(base_loc.x, base_loc.y - size);
    isDead = eaten = false;
    col = c;
    scent_radius = sr;
    t = new Timer(int(random(30,60)));
    offspring = 1;
    sway = new PVector(random(.03,.07), random(.01,.04));
  }
  Flower(PVector l, color c, int sr) {
    base_loc = l;
    size = int(random(150,300));
    top_stem = new PVector(base_loc.x, base_loc.y - size);
    isDead = eaten = false;
    col = c;
    scent_radius = sr;
    t = new Timer(int(random(30,60)));
    offspring = 1;
    sway = new PVector(random(.03,.07), random(.01,.04));
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
    t.countdown();
    //when lifespan in seconds is 0, dies
    if(t.end) isDead = true;
    move();
  }
  void move() {
    //sway
    top_stem.x+=sway.x;
    top_stem.y+=sway.y;
    println(sway);
    if(top_stem.x > base_loc.x + 5 || top_stem.x < base_loc.x - 5)
      sway.x*=-1;
    if(top_stem.y > base_loc.y + 2 || top_stem.y < base_loc.y - 2)
      sway.y*=-1;
  }
  void eaten() {
    eaten = true; 
  }
  PVector getLoc() {
    return top_stem; 
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
    if(t.end) isDead = true;
  }
}