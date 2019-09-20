import processing.awt.PGraphicsJava2D;

// Will allow access to the sketch's graphics renderer, g.
PGraphicsJava2D renderer;
Veiw veiw1, veiw2;

UI ui;
boolean[] pressed = new boolean[256];
SysCoords coords;
Veiw veiw;
Points points1;
Points points2;
color black = color(0,0,0);
color red = color(255,0,0);
color blue = color(0,0,255);
color orange = color(255,180,100);
color yellow = color(255,255,0);

void setup(){
  ui = new UI(this);
   veiw1 = new Veiw(width*0.10,height*0.10,width*0.4,height*0.4);
   veiw2 = new Veiw(width*0.50,height*0.50,width*0.9,height*0.9);
  points1 = new Points(veiw1);
  points2 = new Points(veiw2);
  
  size(800, 800, JAVA2D);
  renderer = (PGraphicsJava2D)g;
}

void draw(){
  background(220);
  
  if (ui.mPressed){
    points1.addPointAt(new PVector(mouseX,mouseY));
    points2.addPointAt(new PVector(mouseX,mouseY));
  }
  
  if (ui.mRelesed){
    ui.setMPressed(false);
  }
  
  points1.renderPointst();
  points2.renderPointst();
  
  veiw1.renderBoundry();
  veiw2.renderBoundry();
}

void mousePressed(){
  ui.setMPressed(true);
}

void mouseReleased(){
  ui.setMPressed(false);
}

void keyPressed() {
  pressed[keyCode] = true;
}

void keyReleased() {
  pressed[keyCode] = false;
}

boolean[] getPressedArray(){
  return pressed;
}
