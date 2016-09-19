class Bubble {
  PVector loc;
  float[] waves = new float[3];
  boolean once, gone;
  int r, g, b;
  float size;
  int[] alpha = new int[3];
  Bubble() {
    loc = new PVector(random(width), random(height));
    size = random(20,80);
    alpha[0] = 250;
    alpha[1] = 0;
    alpha[2] = 0;
    float r = random(5,15);
    for(int i = 0; i < waves.length; i++) {
      waves[i] = (i * size) + r;
    }
    r = 150;
    g = 170;
    b = 170;
    once = gone = false;
  }
  void display() {
    noFill();
    for(int i = 0; i < waves.length; i++) {
      stroke(r,g,b, alpha[i]);
      ellipse(loc.x, loc.y, waves[i], waves[i]);
    }
    fade();
  }
  void fade() {
    alpha[0]-=2;
    if(alpha[1] > 0)
      alpha[1]-=2;
    if(alpha[2] > 0) 
      alpha[2]-=2;
      
    if(alpha[0] <= 0)
      once = true;
    if(alpha[0] <= 0 && alpha[1] <= 0 && alpha[2] <= 0)
      gone = true;
      
    if(alpha[0] <= 230 && alpha[1] == 0 && !once) 
      alpha[1] = 250;
    else if(alpha[1] <= 190 && alpha[2] == 0 && !once)
      alpha[2] = 250;
  }
}