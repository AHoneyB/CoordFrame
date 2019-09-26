class DObject {

  PVector pos;
  //PVector vel;
  //PVector acc;
  
  ArrayList<DVector> obejctVectorlist;
  
  boolean selected;

  DObject() {
    pos = new PVector(0, 0);
    // ADD 1st vector for velocity
    obejctVectorlist = new ArrayList<DVector>();
    obejctVectorlist.add(new DVector());
  }

  DObject(float x, float y) {
    pos = new PVector(x, y);
      // ADD 1st vector for velocity
      obejctVectorlist = new ArrayList<DVector>();
    obejctVectorlist.add(new DVector());
  }

  DObject(PVector pv) {
    pos = pv;
      // ADD 1st vector for velocity
      obejctVectorlist = new ArrayList<DVector>();
    obejctVectorlist.add(new DVector());
  }
  
  PVector getVelocity(){
    return obejctVectorlist.get(0);
  }
  
  void setVelocity(PVector v){
    obejctVectorlist.get(0).x = v.x;
    obejctVectorlist.get(0).y = v.y;
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
    if (getVelocity().mag()>0) {
     ((DVector)getVelocity()).render(renderer, black);
    }
  } 
  
  
}
