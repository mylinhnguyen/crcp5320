class Butterfly {
  PVector loc, speed, target;
  float wave, amp, omega;
  float OAMP = 0.5, OOMEGA = 0.5;
  int size, detect_radius;
  color col;
  boolean top, bot, is_hungry, en_route, set;
  Timer hunger, feed;
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
    feed = new Timer(5);
    target = new PVector(0,0);
    col = color(10);
    amp = random(.5,1);
    is_hungry = set = en_route = top = bot = false;
    detect_radius = int(random(50,100));
  }
  Butterfly(float o, float a) {
    loc = new PVector(random(-50, -10), random(100, height - 100));
    speed = new PVector(random(.5,2),random(-.5,.5));
    omega = o;
    amp = a;
    target = new PVector(0,0);
    col = color(250);
    is_hungry = set = en_route = top = bot = false;
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
    if(en_route && !set) {
      //change speed
      speed.x/=speed.x;
      float m = ((target.y - loc.y)/2) / (target.x - loc.x)/2;
      speed.y = speed.x*m;
      set = true;
    }
    else if(en_route && set && (loc.x - .1 >= target.x && loc.x + .1 <= target.x) && (loc.y - .1 >= target.y && loc.y + .1 <= target.y)) { //&& loc != target
      println("Loc: " + loc + " Target: " + target);
      speed.x=(target.x - loc.x)/100;
      speed.y = ((target.y - loc.y)/2) / (target.x - loc.x)/2;
      loc.x+=speed.x;
      loc.y+=wave + speed.y;
    }
    else if(en_route && set) {
      println("Stopped");
      speed.x = 0;
      speed.y = 0;
      amp = 0;
      omega = 0;
      println(feed.duration);
      if(!feed.end) 
        feed.countdown();
      else {
        en_route = set =  false;
        feed.reset();
        amp = OAMP;
        omega = OOMEGA;
      }
    }
    else {
      if(en_route) wave = 0;
      else  wave = amp * sin(omega*loc.x);
      loc.x+=speed.x;
      loc.y+=wave + speed.y;
    }
    //keeps butterfly within section of screen y wise
    if(loc.y > height-150 && !bot && !en_route) {
      speed.y*=-1;
      bot = true;
      top = false;
    }
    else if(loc.y < 150 && !top && !en_route) {
      speed.y*=-1;
      top = true;
      bot = false;
    }
    //after going off screen x wise, changes direction
    if(loc.x > width + 50 && !en_route) speed.x*=-1;
    else if(loc.x < -50 && !en_route) speed.x*=-1;
  }
  void eat(color c) {
    //gets color of flower and becomes that color
    col = c;
  }
  void flyTo(PVector p) {
    //changes movement to go towards flower 
    if(!en_route) {
      target = p;
      
      en_route = true; 
    }
  }
}