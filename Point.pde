class Point {

  Veiw veiw;
  PVector p;
<<<<<<< Updated upstream
  color c;
=======
  boolean selected;

>>>>>>> Stashed changes

  Point() {
    p = new PVector(9, 9);
    c = color(black);
  }

  Point(float x, float y) {
    p = new PVector(x, y);
    c = color(black);
  }

  Point(PVector pv) {
    p = pv;
    c = color(black);
  }

  void setcolor(color c) {
    this.c = c;
  }

  void setPointAt(PVector pos) {
    p=pos;
  }
<<<<<<< Updated upstream

  void setVeiw() {
  }

  void renderPoint(PGraphicsJava2D rendererSceen,Veiw veiw) {
    this.veiw = veiw;
    if (veiw.inBounds(p)) {
      rendererSceen.pushStyle();
      rendererSceen.noStroke();
      rendererSceen.fill(c);
      rendererSceen.ellipse(p.x, p.y, 5, 5);
      rendererSceen.popStyle();
    }
  }
=======
  
  float distanceTo(PVector q){
    float dx =p.x-q.x;
    float dy =p.y-q.y;
   return sqrt(dx*dx+dy*dy);
  } 
>>>>>>> Stashed changes
}
