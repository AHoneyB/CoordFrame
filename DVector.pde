class DVector extends PVector{

  
  PVector head;
  color c;
  boolean selected;
  float seneitivity = 2.0;
  
  DVector() {
   head = new PVector(0,0);
   selected =false;
  }

  DVector(PVector v) { 
    super(v.x,v.y);
    head = new PVector(v.x,v.y);
    selected =false;
  }
  
   DVector(float x,float y) { 
    super(x,y);
    selected =false;
  }
  
  
  void render(color c) {
    
    this.c = c;
    if (mag()>2)  {
      strokeWeight(2);
      stroke(c);
      pointer(0,0,x, y);
    }
  }

  //distance from a point (mouse point) perpednitcular/orthogonal normal to vector infinite line
  // no matter where point is it is projected onto the normal 
  // x,y = mouse point
 
 
 // select all colinear
  boolean selectedAt(PVector p) {
    PVector l = head.copy(); 
    l = head.copy();
    PVector unitline = (l.copy()).normalize();
    PVector hyp = p.copy();
    PVector dy =unitline.mult(hyp.dot(unitline));  // line projection of mouse position
    PVector dx = hyp.sub(dy);        // nomral line
    float lineLength = l.mag();
    float alongline = dy.dot(l.normalize());
    return( alongline>seneitivity && alongline<lineLength && dx.mag()<seneitivity) ;
    }
}
