class Firefly {
  PVector loc;
  color r, g, b;
  int light, fade;
  Firefly() {
    loc = new PVector(random(0,width),random(0, height));
    r=250;
    g=250;
    b=0;
    light = int(random(5,250));
    fade = -1;
  }
  void display() {
    noStroke();
    fill(r, g, b, light);
    ellipse(loc.x, loc.y, 8, 8);
    move();
  }
  void move() {
    light+=fade;
    if(light <= 0) fade*=-1;
    else if(light >= 250) fade*=-1;
  }
}