class DObject {

  PVector pos;
  //PVector vel;
  //PVector acc;
  
  ArrayList<DVector> obejctVectorlist;
  
  boolean selected;

  DObject() {
    pos = new PVector(0, 0);
  }

  DObject(float x, float y) {
    pos = new PVector(x, y);
  }

  DObject(PVector pv) {
    pos = pv;
  }

  void setPointAt(PVector pos) {
    this.pos=pos;
  }

  float distanceTo(PVector q) {
    float dx =pos.x-q.x;
    float dy =pos.y-q.y;
    return sqrt(dx*dx+dy*dy);
  }
  
  void renderPoint(PGraphicsJava2D rendererSceen){
    rendererSceen.ellipse(pos.x, pos.y, 10, 10);
  } 
}
