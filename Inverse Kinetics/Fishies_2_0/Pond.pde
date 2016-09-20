class Pond {
  Skeleton s, t, u;
  Rain r;
  PImage border, bottom;
  ArrayList<Rain> rain = new ArrayList<Rain>();
  ArrayList<Bubble> bub = new ArrayList<Bubble>();
  Firefly[] ff = new Firefly[20];
  boolean dayNight;
  Pond() {
    border = loadImage("plants2.png");
    bottom = loadImage("pond.png");
    //border.resize(1200,800);
    r = new Rain();
    s = new Skeleton();
    t = new Skeleton(120, "BLACK");
    u = new Skeleton(240, "GOLD");
    bub.add(new Bubble());
    rain.add(new Rain());
    for(int i = 0; i < ff.length; i++) 
      ff[i] = new Firefly();
  }
  void display() {
    //background(145,200,200);
    background(bottom);
    r.display();
    s.display();
    t.display();
    u.display();
    for(int j = 0; j < rain.size(); j++) {
      rain.get(j).display();
      if(rain.get(j).fallen) {
        PVector p = rain.get(j).eloc;
        rain.remove(j);
        bub.add(new Bubble(p));
      }
    }
    for(int i = 0; i < bub.size(); i++) {
      bub.get(i).display();
      if(bub.get(i).gone) bub.remove(i);
    }
    createRain();
    if(dayNight) {
      fill(10,170);
      rect(0, 0, width, height);
      image(border,width/2, height/2);
      fill(10,60);
      rect(0, 0, width, height);
      for(int i = 0; i < ff.length; i++) 
        ff[i].display();
    }
    else {
      image(border,width/2, height/2);
    }
  }
  void createRain() {
    float f = random(0,100);
    if(f < 2)
      rain.add(new Rain());
  }
  void mouseClicked() {
    if(!dayNight) dayNight = true; 
    else dayNight = false;
  }
}