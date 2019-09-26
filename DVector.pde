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
  
  
  void render(PGraphicsJava2D renderer, color c) {
    
    this.c = c;
    if (mag()>2)  {
      strokeWeight(2);
      stroke(c);
      pointer(renderer,0,0,x, y);
    }
  }
  
   void pointer(PGraphicsJava2D renderer,float x1, float y1, float x2, float y2) {

    // draw the line
    renderer.line(x1, y1, x2, y2);

    // draw a triangle at (x2, y2)
    renderer.pushMatrix();
    renderer.translate(x2, y2);
    float an = atan2(x1-x2, y2-y1);
    renderer.rotate(an);
    renderer.line(0, 0, -10, -10);
    renderer.line(0, 0, 10, -10);
    renderer.popMatrix();
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
