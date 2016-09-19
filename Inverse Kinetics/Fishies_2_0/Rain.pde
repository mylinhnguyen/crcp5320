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
  
  Rain() {
    speed = new PVector(0,0);
    //generate eloc first then backtrack to floc
    eloc = new PVector(random(ex, ex+exd), random(ey, ey+eyd));
    println(eloc);
    //Determine starting point and slope depending on region generated
    if(eloc.x >= ex && eloc.x <= ex + rx) {
      if(eloc.y >= ey && eloc.y <= ey + ry) {
      // 1
      floc = new PVector(eloc.x - random(rx, rx + 50), eloc.y - random(ry, ry + 50));
      speed.x = (eloc.x - floc.x)/2;
      speed.y = ((eloc.y - floc.y)/2) / (eloc.x - floc.x)/2;
      println(1);
      }
      else if(eloc.y >= ey + ry && eloc.y <= ey + ry*2) {
      // 4
      println(4);
      floc = new PVector(eloc.x - random(rx, rx + 50), eloc.y - random(ry/2));
      
      }
      else if(eloc.y >= ey + ry*2 && eloc.y <= ey + eyd) {
      // 7
      println(7);
      floc = new PVector(eloc.x - random(rx, rx + 50), eloc.y + random(ry, ry + 50));
      
      }
    }
    else if(eloc.x >= ex + rx && eloc.x <= ex + rx*2) {
      if(eloc.y >= ey && eloc.y <= ey + ry) {
      // 2
      floc = new PVector(eloc.x - random(rx/2), eloc.y - random(ry, ry + 50));
      
      println(2);
      }
      else if(eloc.y >= ey + ry && eloc.y <= ey + ry*2) {
      // 5
      println(5);
      floc = new PVector(eloc.x + random(rx/2), eloc.y + random(-ry/2,ry/2));
      
      }
      else if(eloc.y >= ey + ry*2 && eloc.y <= ey + eyd) {
      // 8
      println(8);
      floc = new PVector(eloc.x + random(rx/2), eloc.y + random(ry, ry + 50));
      
      }
    }
    else if(eloc.x >= ex + rx*2 && eloc.x <= ex + exd) {
      if(eloc.y >= ey && eloc.y <= ey + ry) {
      // 3
      println(3);
      floc = new PVector(eloc.x + random(rx, rx + 50), eloc.y - random(ry, ry + 50));
      
      }
      else if(eloc.y >= ey + ry && eloc.y <= ey + ry*2) {
      // 6
      println(6);
      floc = new PVector(eloc.x + random(rx, rx + 50), eloc.y + random(ry/2));
      
      }
      else if(eloc.y >= ey + ry*2 && eloc.y <= ey + eyd) {
      // 9
      println(9);
      floc = new PVector(eloc.x + random(rx, rx + 50), eloc.y + random(ry, ry + 50));
      speed.x = -(eloc.x - floc.x)/2;
      speed.y = -((eloc.y - floc.y)/2) / (eloc.x - floc.x)/2;
      }
    }
    println(speed);
    //calcSlope();
    col = color(150,150,160);
    len = random(10,20);
  }
  void calcSlope() {
    speed.x = (floc.x - eloc.x)/100;
    speed.y = ((floc.y - eloc.y)/2) / (floc.x - eloc.x)/2;
  }
  void display() {
    stroke(col);
    strokeWeight(4);
    vertex(floc.x, floc.y);
    strokeWeight(2);
    //regions
    rectMode(CENTER);
    rect(width/2, height/2, exd, eyd);
    rect(width/2, height/2, cxd, cyd);
    fall();
    ellipse(eloc.x, eloc.y, 10,10);
  }
  void fall() {
    floc.x+=speed.x;
    floc.y+=speed.y;
    println(floc + " " + speed);
  }
}