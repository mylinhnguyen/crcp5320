class Butterfly {
  PVector loc, speed;
  float wave, amp, omega;
  int size, detect_radius;
  color col;
  boolean top, bot, is_hungry, en_route;
  Butterfly() {
    //loc offscreen
    //speed pos or neg depending on where offscreen spawn
    //size range from big to small
    //no color if spawned as adult
    int i = int(random(0,1));
    if(i == 0) {
      loc = new PVector(random(-50, -10), random(100, height - 100));
      speed = new PVector(random(.5,2),random(-.5,.5));
      omega = .03;
    }
    else {
      loc = new PVector(random(width + 10, width + 50), random(0, height));
      speed = new PVector(-random(.5,2),random(-.5,.5));
      omega = random(.03, .5);
    }
    col = color(250);
    amp = random(.5,1);
    en_route = top = bot = false;
    detect_radius = int(random(50,100));
  }
  Butterfly(float o, float a) {
    loc = new PVector(random(-50, -10), random(100, height - 100));
    speed = new PVector(random(.5,2),random(-.5,.5));
    omega = o;
    amp = a;
    col = color(250);
    top = bot = false;
    detect_radius = int(random(50,100));
  }
  void display() {
    //Maybe 2 visuals, focus on small, less-detailed for now that moves around screen
    //other visual close-up, more detailed ?
    noStroke();
    fill(col);
    ellipse(loc.x, loc.y, 10, 10);
  }
  
  void move() {
    //if started on left side, tendency towards right
    //if started on right side, tendency towards left
    wave = amp * sin(omega*loc.x);
    loc.x+=speed.x;
    loc.y+=wave + speed.y;
    //keeps butterfly within section of screen y wise
    if(loc.y > height-150 && !bot) {
      speed.y*=-1;
      bot = true;
      top = false;
    }
    else if(loc.y < 150 && !top) {
      speed.y*=-1;
      top = true;
      bot = false;
    }
    //after going off screen x wise, changes direction
    if(loc.x > width + 50) speed.x*=-1;
    else if(loc.x < -50) speed.x*=-1;
    
  }
  void eat(color c) {
    //gets color of flower and becomes that color
    col = c;
  }
  void flyTo() {
    //changes movement to go towards flower 
    if(!en_route) {
      
      en_route = true; 
    }
  }
}