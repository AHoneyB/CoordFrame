class Point {

  PVector p;


  Point() {
    p = new PVector(0, 0);
  }

  Point(float x, float y) {
    p = new PVector(x, y);
  }

  Point(PVector pv) {
    p = pv;
  }

  void setPointAt(PVector pos) {
    p=pos;
  }

  void pointRender(PGraphicsJava2D rendererSceen,color c){
    rendererSceen.pushStyle();
    rendererSceen.noStroke();
    rendererSceen.fill(c);
    rendererSceen.ellipse(p.x, p.y, 5, 5);
    rendererSceen.popStyle();
  }


}
