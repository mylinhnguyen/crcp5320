int i = 0;
ArrayList<Images> imag = new ArrayList();
void setup() {
  size(800,800); 
  imag.add(new Images());
    
}
void draw() {
  background(250);
  imag.get(0).display();
  imag.get(0).move();
}
void keyPressed() {
 if(key == 's' || key == 'S') {
   save("image" + i + ".jpg"); 
   i++;
 }
 if(keyCode == 82 || keyCode == 114) imag.get(0).redraw();
}