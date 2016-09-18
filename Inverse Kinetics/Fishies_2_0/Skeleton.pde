//uses code from Ira Greenberg's Processing/ik_atan_ver01.pde
class Skeleton {
  PVector[] nloc = new PVector[4];
  int[] lens = new int[4]; 
  float mx, my;
  float a;
  Skeleton() {
    lens[0] = 20;
    lens[1] = 30;
    lens[2] = 60;
    lens[3] = 40;
    for(int i = 0; i < 4; i++)
      nloc[i] = new PVector(lens[i]*i, 0);
    a = 0;
  }
  Skeleton(int angle) {
    lens[0] = 20;
    lens[1] = 30;
    lens[2] = 60;
    lens[3] = 40;
    for(int i = 0; i < 4; i++)
      nloc[i] = new PVector(lens[i]*i, 0);
    a = angle;
  }
  void display() {
    calculate();
    stroke(10);
    fill(250);
    for(int i = 0; i < 4; i++) 
      ellipse(nloc[i].x, nloc[i].y, lens[i], lens[i]);
  }
  void calculate() {
    mx = 0 + 300 * cos(radians(a)); //mouseX - width/2;
    my = 0 + 300 * sin(radians(a)); //mouseY - height/2;
    nloc[3].x = mx;
    nloc[3].y = my;
    translate(width/2, height/2);
    float theta, wave;
    for(int i = 3; i > 0; i--) {
      theta = atan2(nloc[i].y - nloc[i-1].y, nloc[i].x - nloc[i-1].x);
      wave = 1 * sin(.05 * nloc[i-1].x);
      nloc[i-1].x = (nloc[i].x - cos(theta) * lens[i]) + wave;
      nloc[i-1].y = nloc[i].y - sin(theta) * lens[i];
    }
    //
    /*wave = amp * sin(omega*loc.x);
    */
    //
    a+=.6;
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
}