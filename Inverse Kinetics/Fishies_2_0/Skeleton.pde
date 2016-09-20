//uses code from Ira Greenberg's Processing/ik_atan_ver01.pde
class Skeleton {
  PVector[] nloc = new PVector[5];
  int[] lens = new int[5]; 
  PVector speed;
  float mx, my;
  float a, dvalue;
  float wave, omega, amp;
  boolean BLACK, WHITE, GOLD;
  Skeleton() {
    lens[0] = 20;
    lens[1] = 30;
    lens[2] = 50;
    lens[3] = 60;
    lens[4] = 40;
    for(int i = 0; i < nloc.length; i++)
      nloc[i] = new PVector(0, 0);
    a = 0;
    dvalue = .6;
    speed = new PVector(random(-1,2),random(-1,.5));
    WHITE = true;
  }
  Skeleton(int angle) {
    lens[0] = 20;
    lens[1] = 30;
    lens[2] = 50;
    lens[3] = 60;
    lens[4] = 40;
    for(int i = 0; i < nloc.length; i++)
      nloc[i] = new PVector(lens[i]*i, 0);
    a = angle;
    dvalue = .6;
    WHITE = true;
  }
  Skeleton(int angle, String s) {
    lens[0] = 20;
    lens[1] = 30;
    lens[2] = 50;
    lens[3] = 60;
    lens[4] = 40;
    for(int i = 0; i < nloc.length; i++)
      nloc[i] = new PVector(lens[i]*i, 0);
    a = angle;
    dvalue = .6;
    if(s == "BLACK") BLACK = true;
    else if(s == "WHITE") WHITE = true;
    else if(s == "GOLD") GOLD = true;
  }
  void display() {
    imageMode(CENTER);
    pushMatrix();
    calculate();
    //calculate2();
    noStroke();
    if(WHITE) {
      fill(240);
      for(int j = 0; j < nloc.length; j++) 
        ellipse(nloc[j].x, nloc[j].y, lens[j]*1.2, lens[j]*1.2);
      fill(250);
      for(int i = 0; i < nloc.length; i++) {
        ellipse(nloc[i].x, nloc[i].y, lens[i], lens[i]);
        if(i == 3 || i == 4)
        ellipse((nloc[i].x + nloc[i-1].x)/2, (nloc[i].y + nloc[i-1].y)/2, (lens[i] + lens[i-1])/2, (lens[i] + lens[i-1])/2);
      }
    }
    else if(BLACK) {
      fill(240);
      for(int j = 0; j < nloc.length; j++) 
        ellipse(nloc[j].x, nloc[j].y, lens[j]*1.2, lens[j]*1.2);
      fill(10);
      for(int i = 0; i < nloc.length; i++) {
        ellipse(nloc[i].x, nloc[i].y, lens[i], lens[i]);
        if(i == 3 || i == 4) {
          ellipse((nloc[i].x + nloc[i-1].x)/2, (nloc[i].y + nloc[i-1].y)/2, (lens[i] + lens[i-1])/2, (lens[i] + lens[i-1])/2);
        }
      }
    }
    else if(GOLD) {
      fill(240);
      for(int j = 0; j < nloc.length; j++) 
        ellipse(nloc[j].x, nloc[j].y, lens[j]*1.2, lens[j]*1.2);
      fill(240,240,12);
      for(int i = 0; i < nloc.length; i++) {
        ellipse(nloc[i].x, nloc[i].y, lens[i], lens[i]);
        if(i == 3 || i == 4)
        ellipse((nloc[i].x + nloc[i-1].x)/2, (nloc[i].y + nloc[i-1].y)/2, (lens[i] + lens[i-1])/2, (lens[i] + lens[i-1])/2);
      }
    }
    fill(250,0,0);
    ellipse(nloc[4].x, nloc[4].y, 20, 20);
    ellipse(nloc[3].x, nloc[3].y, 30, 30);
    popMatrix();
  }
  void calculate2() {
    wave = 1 * sin(.05*nloc[4].x);
    nloc[4].x+=speed.x;
    nloc[4].y+=wave + speed.y;
    float theta;
    for(int i = nloc.length - 1; i > 0; i--) {
      theta = atan2(nloc[i].y - nloc[i-1].y, nloc[i].x - nloc[i-1].x);
      //wave = 1 * sin(.05 * nloc[i-1].x);
      nloc[i-1].x = (nloc[i].x - cos(theta) * lens[i]) + wave;
      nloc[i-1].y = nloc[i].y - sin(theta) * lens[i];
    }
    if(nloc[4].x > width + 75 || nloc[4].x < -75) speed.x*=-1;
  }
  void calculate() {
    mx = 0 + 300 * cos(radians(a)); //mouseX - width/2;
    my = 0 + 300 * sin(radians(a)); //mouseY - height/2;
    nloc[4].x = mx;
    nloc[4].y = my;
    translate(width/2, height/2);
    float theta, wave;
    for(int i = nloc.length - 1; i > 0; i--) {
      theta = atan2(nloc[i].y - nloc[i-1].y, nloc[i].x - nloc[i-1].x);
      wave = 1 * sin(.05 * nloc[i-1].x);
      nloc[i-1].x = (nloc[i].x - cos(theta) * lens[i]) + wave;
      nloc[i-1].y = nloc[i].y - sin(theta) * lens[i];
    }
    //
    /*wave = amp * sin(omega*loc.x);
    */
    //
    a+=dvalue;
    if(a > 360) a = 0;
    /*
    float theta = atan2(nloc[3].y - nloc[2].y, nloc[3].x - nloc[2].x);
    //if(theta < 2) theta = 2;
    println(theta);
    println(cos(theta) + " " + sin(theta));
    println(degrees(theta));
    nloc[2].x = nloc[3].x - cos(theta) * len;
    nloc[2].y = nloc[3].y - sin(theta) * len;
    theta = atan2(nloc[2].y - nloc[1].y, nloc[2].x - nloc[1].x);
    nloc[1].x = nloc[2].x - cos(theta) * len;
    nloc[1].y = nloc[2].y - sin(theta) * len;
    theta = atan2(nloc[1].y - nloc[0].y, nloc[1].x - nloc[0].x);
    nloc[0].x = nloc[1].x - cos(theta) * len;
    nloc[0].y = nloc[1].y - sin(theta) * len;
    */
    
    /*
    nx[0] = mouseX - width/2;
    ny[0] = mouseY - height/2;
    translate(width/2, height/2);
    float theta = atan2(ny[3]-ny[2], nx[3]-nx[2]);
    nx[2] = nx[3] - cos(theta)*len;
    ny[2] = ny[3] - sin(theta)*len;
    
    theta = atan2(ny[2]-ny[1], nx[2]-nx[1]);
    nx[1] = nx[2] - cos(theta)*len;
    ny[1] = ny[2] - sin(theta)*len;
    
    for(int i = 0; i < 4; i++) 
      ellipse(nx[i], nx[i], 10, 10);
    */
  }
  /*
    private void dragSegment(int i, float xin, float yin) {
    float dx = xin - bsx[i];
    float dy = yin - bsy[i];
    float angle = atan2(dy, dx);
    bsx[i] = xin - cos(angle) * FISH_LENGTH;
    bsy[i] = yin - sin(angle) * FISH_LENGTH;
    if(BODY_TYPE == 0) {
      segment(bsx[i], bsy[i], angle);
    }
    else if(BODY_TYPE == 1) {
      bodySegment(bsx[i], bsy[i], angle);
    }
    else {
      tailSegment(bsx[i], bsy[i], angle);
    }
  }
  private void segment(float x,float y,float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    stroke(head);
    //
    line( 15, 10, 15,-10);
    line(-20, 20, 15, 10);
    line(-20,-20, 15,-10);
    line(-20, 20,-30, 20);
    line(-20,-20,-30,-20);
    line(-30, 20,-35, 15);
    line(-30, -20,-35,-15);
    popMatrix();
  }
  private void bodySegment(float x,float y,float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    stroke(body);
    line( 15, 20,-15, 25);
    line( 15,-20,-15,-25);
    line(-15, 25,-30, 20);
    line(-15,-25,-30,-20);
    line(-30, 20,-35, 15);
    line(-30,-20,-35,-15);
    stroke(200);
    //fins
    line( 15, 20,-18, 40);
    line( 15,-20,-18,-40);
    line(-15, 25,-18, 40);
    line(-15,-25,-18,-40);
    //dorsal fin
    line( 5, 0,-15, 0);
    line(10, 0,  0, 0);
    stroke(body);
    popMatrix();
  }
  private void tailSegment(float x,float y,float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    stroke(tail);
    line( 12, 15,-20,  5);
    line( 12,-15,-20, -5);
    line(-25, 10,-50, 20);
    line(-25,-10,-50,-20);
    line(-25,  5,-50, 20);
    line(-25, -5,-50,-20);
    popMatrix();
  }
  */
}