import processing.awt.PGraphicsJava2D;

// Will allow access to the sketch's graphics renderer, g.
PGraphicsJava2D renderer;
UI ui;
Sceen sceen;
boolean[] pressed = new boolean[256];
SysCoords coords;

color black = color(0,0,0);
color red = color(255,0,0);
color blue = color(0,0,255);
color orange = color(255,180,100);
color yellow = color(255,255,0);

void setup(){
  size(800, 800, JAVA2D);
  renderer = (PGraphicsJava2D)g;
  ui = new UI(this);
  sceen = new Sceen(renderer);
  
}

void draw(){
  background(220);
  sceen.render();
  
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
