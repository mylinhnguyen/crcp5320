class Rain {
  PVector floc, eloc, speed;
  float m;
  float len;
  color col;
  //boolean left = false, right = false, up = false, down = false, center = false;
  boolean fallen = false;
  //End-point rectangle
  int ex = width/12, ey = height/6;
  int exd = (width/12) * 10, eyd = (height/8) * 6;
  //End-point inner rectangle
  int cx = width/2 - (exd/3)/2, cy = height/2 - (eyd/3)/2;
  int cxd = exd/3, cyd = eyd/3;
  //End-point region sizes
  int rx = cxd, ry = cyd;
  int spdif;
  Rain() {
    speed = new PVector(0,0);
    eloc = new PVector(random(ex, ex+exd), random(ey, ey+eyd));
    floc = new PVector(random(width, width + 50),random(-50,0));
    //y = mx + b  -> m = y/x
    m = -(eloc.y - floc.y)/(eloc.x - floc.x);
    spdif = int(random(4, 8));
    col = color(50,50,150);
    len = random(10,20);
  }
  void calcSlope() {
    speed.x = 2;
    speed.y = -((floc.y - eloc.y)/2) / (floc.x - eloc.x)/2;
  }
  void display() {
    stroke(col);
    //regions
    //rectMode(CENTER);
    //rect(width/2, height/2, exd, eyd);
    //rect(width/2, height/2, cxd, cyd);
    fill(col);
    if(!fallen)
      ellipse(floc.x, floc.y, 3, 3);
    fall();
  }
  void fall() {
    floc.x-=1*spdif;
    floc.y+=m*spdif;
    println(floc.x + " " + floc.y + " " + m);
    //floc.x-=speed.x;
    //floc.y+=speed.y*2;
    println(floc.x + " " + floc.y);
    if((floc.x - 5 < eloc.x && floc.x + 5 > eloc.x) && (floc.y - 5 < eloc.y && floc.y > eloc.y))
      fallen = true;
  }
}