class DObject {

  PVector pos;
  ArrayList<DVector> obejctVectorlist;
  boolean selected;
  //PVector vel;
  //PVector acc;
 
  DObject() {
    pos = new PVector(0, 0);
    // ADD 1st vector for velocity
    obejctVectorlist = new ArrayList<DVector>();
    obejctVectorlist.add(new DVector(pos));
  }

  DObject(float x, float y) {
    pos = new PVector(x, y);
      // ADD 1st vector for velocity
    obejctVectorlist = new ArrayList<DVector>();
    obejctVectorlist.add(new DVector(0,0));
  }

  DObject(PVector pv) {
    pos = pv;
      // ADD 1st vector for velocity
      obejctVectorlist = new ArrayList<DVector>();
    obejctVectorlist.add(new DVector(0,0));
  }
  
  PVector getVelocity(){
    PVector vel = obejctVectorlist.get(0);
    //println("Velocity mag = "+vel.mag()+" coords ="+vel.toString());
    //println("POSition mag = "+pos.mag()+" coords ="+pos.toString());
    //println();
    return vel;
  }
  
  void setVelocity(PVector v){
    obejctVectorlist.get(0).x = v.x;
    obejctVectorlist.get(0).y = v.y;
  }

  void setPointAt(PVector mpos) {
    PVector dif = (mpos.copy()).sub(pos);
    this.pos=mpos;
  }

  float distanceTo(PVector q) {
    float dx =pos.x-q.x;
    float dy =pos.y-q.y;
    return sqrt(dx*dx+dy*dy);
  }

  void renderPoint(PGraphicsJava2D rendererSceen){
    PVector vel =getVelocity();
    rendererSceen.ellipse(pos.x, pos.y, 10, 10);
    if (vel.mag()>3) {
     ((DVector)getVelocity()).render(renderer,pos, black);
    }
  } 

}
