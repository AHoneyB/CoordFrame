import processing.awt.PGraphicsJava2D;

// Will allow access to the sketch's graphics renderer, g.
PGraphicsJava2D renderer;
UI ui;
Sceen sceen;


color black = color(0,0,0);
color red = color(255,0,0);
color blue = color(0,0,255);
color orange = color(255,180,100);
color yellow = color(255,255,0);
color backGround = color(220);

void setup(){
  size(700, 600, JAVA2D);
  ui = new UI(this);
  renderer = (PGraphicsJava2D)g;
  sceen = new Sceen(renderer,ui);
  
}

void draw(){
  background(backGround);
  sceen.render();
  
}

void mousePressed(){
  ui.setMPressed(true);
}

void mouseReleased(){
  ui.setMPressed(false);
}

void keyPressed() {
  ui.pressed[keyCode] = true;
}

void keyReleased() {
  ui.pressed[keyCode] = false;
}
