class Butterfly {
  PVector loc, speed, target;
  float wave, amp, omega;
  float OAMP = 0.5, OOMEGA = 0.5;
  int size, detect_radius;
  color col;
  boolean top, bot, is_hungry, en_route, set, stop, eating;
  Timer hunger, feed;
  PImage body, wingl, wingr;
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
    hunger = new Timer(int(random(10,20)));
    feed = new Timer(2);
    target = new PVector(0,0);
    col = color(250);
    amp = random(.5,1);
    eating = stop = is_hungry = set = en_route = top = bot = false;
    detect_radius = int(random(50,100));
    body = loadImage("butterflyBody.png");
    body.resize(20,20);
    wingl = loadImage("butterflyLeft.png");
    wingl.resize(30,30);
    wingr = loadImage("butterflyRight.png");
    wingr.resize(30,30);
  }
  Butterfly(float o, float a) {
    loc = new PVector(random(-50, -10), random(100, height - 100));
    speed = new PVector(random(.5,2),random(-.5,.5));
    omega = o;
    amp = a;
    target = new PVector(0,0);
    col = color(250);
    eating =  stop = is_hungry = set = en_route = top = bot = false;
    detect_radius = int(random(50,100));
    hunger = new Timer(int(random(10,20)));
    feed = new Timer(3);
    body = loadImage("butterflyBody.png");
    body.resize(20,20);
    wingl = loadImage("butterflyLeft.png");
    wingl.resize(30,30);
    wingr = loadImage("butterflyRight.png");
    wingr.resize(30,30);
  }
  void display() {
    //Maybe 2 visuals, focus on small, less-detailed for now that moves around screen
    //other visual close-up, more detailed ?
    /*
    noStroke();
    fill(col);
    ellipse(loc.x, loc.y, 10, 10);
    */
    image(body, loc.x, loc.y);
    image(wingl, loc.x-wingl.width/2, loc.y);
    image(wingr, loc.x + wingr.width/2, loc.y);
  }
  /*
  void hunger() {
    if(!is_hungry) {
      hunger.go(); 
      hunger.countdown();
      if(hunger.end)
        is_hungry = true;
    }
  }
  */
  void move() {
    //hunger();
    //if started on left side, tendency towards right
    //if started on right side, tendency towards left
    if(en_route && !set) {
      //change speed
      speed.x/=speed.x;
      float m = ((target.y - loc.y)/2) / (target.x - loc.x)/2;
      speed.y = speed.x*m;
      set = true;
    }
    else if(en_route && set && !stop && loc != target) {
      //println("Loc: " + loc + " Target: " + target);
      if(target.x > loc.x) {
        speed.x=(target.x - loc.x)/100;
        speed.y = ((target.y - loc.y)/2) / (target.x - loc.x)/2;
      }
      else {
        speed.x=(loc.x - target.x)/100;
        speed.y = ((loc.y - target.y)/2) / (loc.x - target.x)/2;
      }
      loc.x+=speed.x;
      loc.y+=wave + speed.y;
      if((loc.x - 1 < target.x && loc.x + 1 > target.x) 
      && (loc.y - 1 < target.y && loc.y + 1 > target.y)){
        stop = true;
      }
    }
    else if(en_route && set && stop) {
      speed.x = 0;
      speed.y = 0;
      amp = 0;
      omega = 0;
      eating = true;
      if(!feed.end) {
        feed.go();
        feed.countdown();
      }
      else {
        en_route = set = stop =  false;
        is_hungry = false;
        feed.reset();
        //hunger.reset();
        amp = random(.5,1);
        omega = random(.03,.5);
        speed = new PVector(random(.5,2),random(-.5,.5));
        eating = false;
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
  boolean outOfBounds() {
    if((loc.x < -200 || loc.x > width + 200) || (loc.y < -200 || loc.y > height + 200))
      return true;
    else return false;
  }
}