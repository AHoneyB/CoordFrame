class DObject {

  PVector pos;
  ArrayList<PVector> objectVectorlist;
  boolean selected;
  float scaleOfSum = 0.01;
  float limitMag = 50;
  //PVector vel;
  //PVector acc;
 
  DObject() {
    pos = new PVector(0, 0);
    // ADD 1st vector for velocity
    objectVectorlist = new ArrayList<PVector>();
    objectVectorlist.add(new DVector(pos));
  }

  DObject(float x, float y) {
    pos = new PVector(x, y);
      // ADD 1st vector for velocity
    objectVectorlist = new ArrayList<PVector>();
    objectVectorlist.add(new DVector(0,0));
  }

  DObject(PVector pv) {
    pos = pv;
      // ADD 1st vector for velocity
      objectVectorlist = new ArrayList<PVector>();
    objectVectorlist.add(new DVector(0,0));
  }
  
  PVector getVelocity(){
    PVector vel = objectVectorlist.get(0);
    //println("Velocity mag = "+vel.mag()+" coords ="+vel.toString());
    //println("POSition mag = "+pos.mag()+" coords ="+pos.toString());
    //println();
    return vel;
  }
  
  void setVelocity(PVector v){
   
    objectVectorlist.get(0).x = v.x;
    objectVectorlist.get(0).y = v.y;
  }
  
 

  void setPointAt(PVector mpos) {
    //PVector dif = (mpos.copy()).sub(pos);
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
  
  void addObejctVectorlist(){
    //println("Moved selected");
    PVector temp = new PVector(0,0);
    PVector v= new PVector(0,0);
    for (int i=0;i<objectVectorlist.size();i++){
      v =((PVector)objectVectorlist.get(i)).copy();
      v.mult(scaleOfSum);
      temp.add(v);
    }
       //println("v ="+v.mag());
       temp.limit(limitMag);
       pos.add(temp);
  }

}
