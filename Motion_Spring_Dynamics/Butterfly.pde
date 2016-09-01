class Butterfly {
  PVector loc, speed;
  float wave;
  int size;
  color col;
  Butterfly() {
    //loc offscreen
    //speed pos or neg depending on where offscreen spawn
    //size range from big to small
    //no color is spawned as adult
    int i = int(random(0,1));
    if(i == 0) {
      loc = new PVector(random(-50, -10), random(100, height - 100));
      speed = new PVector(random(.5,1),random(-.2,.2));
    }
    else {
      loc = new PVector(random(width + 10, width + 50), random(0, height));
      speed = new PVector(-random(.5,1),random(-.2,.2));
    }
  }
  void display() {
    //Maybe 2 visuals, focus on small, less-detailed for now that moves around screen
    //other visual close-up, more detailed
    ellipse(loc.x, loc.y, 10, 10);
  }
  
  void move() {
    //if started on left side, tendency towards right
    //if started on right side, tendency towards left
    wave = sin(.03*loc.x);
    loc.x+=speed.x;
    loc.y+=wave + speed.y;
    //keeps butterfly within section of screen y wise
    if(loc.y > height-100) speed.y*=-1;
    else if(loc.y < 100) speed.y*=-1;
    //after going off screen x wise, changes direction
    if(loc.x > width + 50) speed.x*=-1;
    else if(loc.x < -50) speed.x*=-1;
    
  }
  void eat(color c) {
    //gets color of flower and becomes that color
  }
  boolean senseFlower(Flower f) {
    //if within range of flower, change movement to head to flower
    return false;
  }
}