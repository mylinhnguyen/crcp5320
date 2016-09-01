class Images {
  ArrayList<Contour> con = new ArrayList();
  float locx, locy;
  float r, a;
  int r_low, r_high,dec, round, max, layers, l;
  boolean stop;
  Images() {
    r = random(200,300);
    locx = width/2;
    locy = height/2;
    a = 0;
    r_low = 300;
    r_high = 400;
    stop = false;
    l = 1;
    layers = 4;
    dec = 1; 
    round = 0;
    max = 6;
    con.add(new Contour(new PVector(locx, locy))); 
  }
  void display() {
    noStroke();
    for(Contour c : con)
      c.draw();
  }
  void addPoint() {
    con.get(con.size()-1).addVert(new PVector(locx,locy));
  }
  //travel in rough circle clockwise then counterclockwise then clockwise for each layer
  void move() {
    if(!stop) {
      if (l > layers) stop = true;
      r = random(r_low, r_high);
      locx = width/2 + r * cos(a);
      locy = height/2 + r * sin(a);
      a+=random(dec);
      addPoint();
      if(a >= 2*PI || a <= -2*PI) {
        round++;
        a = random(dec); 
        r_low-=50;
        r_high-=50;     
        if(r_low < 0) r_low = 0;
        dec*=-1;
        if(round == max) {
          con.add(new Contour(new PVector(locx,locy)));
          l++;
          r_low = 300 - 20*l;
          r_high = 400 - 20*l;
          round = 0;
        }
      }
    }
  }
  void redraw() {
   background(250);
   con.get(con.size()-1).vec.clear();
   con.clear();
   r = random(200,300);
   locx = width/2;
   locy = 100;
   a = 0;
   r_low = 300;
   r_high = 400;
   stop = false;
   dec = 1; 
   round = 0;
   l = 1;
   con.add(new Contour(new PVector(locx, locy)));
  }
}