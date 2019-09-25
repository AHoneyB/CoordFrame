class View {
  Rectangle rect;
  PMatrix2D T;
  float tX, tY;
  float rot;
  color c;
  PGraphicsJava2D rendererSceen;
  boolean focus;
  Sceen sceen;

  View(Sceen sceen, color c) {
    this.sceen = sceen;
    this.c=c;
    rect = new Rectangle(0,0,width,height);
    T = new PMatrix2D();
    T.set( 1.0, 0.0, 0.0,
           0.0, 1.0, 0.0);
    tX = 0; 
    tY = 0 ;
    rot =0;
  }

  View(Sceen sceen, Rectangle rect, color c) {
    this.sceen = sceen;
    this.c=c;
    this.rect =rect;
    rect = new Rectangle(0,0,width,height);
    T = new PMatrix2D();
    T.set( 1.0, 0.0, 0.0,
           0.0, 1.0, 0.0);
    tX = 0; 
    tY = 0 ;
    rot =0;
  }

  //  --- MOUSE ---

  PVector getMouseCoordsFor(float mx, float my) {
    float x= mx-rect.x-tX;
    float y= my-rect.y-tY;
    float xM =(cos(radians(rot))*x+sin(radians(rot))*y);
    float yM =(-sin(radians(rot))*x+cos(radians(rot))*y);

    return new PVector(xM, yM);
  }

  void render(PGraphicsJava2D rendererSceen, Points points) {
    this.rendererSceen = rendererSceen;

    for (int i=0; i<points.pointList.size(); i++) {
      renderObjectClipedAt(points.pointList.get(i));
    }
  }

  void renderObjectClipedAt(Point point) {
    rendererSceen.clip(rect.x, rect.y, rect.w, rect.h);
    VeiwToOrigin(point);
    rendererSceen.noClip();
  }

  void renderSceenRect() {
    pushStyle();
    noFill();
    stroke(orange);
    rect(0, 0, sceen.rect.w, sceen.rect.h);
    popStyle();
  }

  void VeiwToOrigin(Point point) {
    rendererSceen.pushMatrix();
    // Translate coordX+vX,coordY+vY
   rendererSceen.translate(rect.x+tX, rect.y+tY);
   rendererSceen.rotate(radians(rot));
    
    renderSceenRect();
    
    rendererSceen.pushStyle();
    rendererSceen.noStroke();
    if (point.selected){
      rendererSceen.fill(red);
    }
    else {
      rendererSceen.fill(c);
    }
    
    rendererSceen.ellipse(point.p.x, point.p.y, 10, 10);
    rendererSceen.popStyle();
    rendererSceen.popMatrix();
  }


  void renderBoundry() {
    pushStyle();
    noFill();
    stroke(red);
    if (focus) strokeWeight(3); 
    else strokeWeight(1);
    rect(rect.x, rect.y, rect.w, rect.h);
    popStyle();
  }

  boolean mouseInViewBoundry(float x, float y) {
    return (x>rect.x && x<(rect.x+rect.w) && y>rect.y && y<(rect.y+rect.w));
  }

  void translateView() {
    if (ui.pressed[38]) {
      tY--;
    }   // w [87] UP
    if (ui.pressed[40]) {
      tY++;
    }   // s [83] DOWN
    if (ui.pressed[37]) {
      tX--;
    }   // a [65] L
    if (ui.pressed[39]) {
      tX++;
    }   // d [68] R
    PVector t=new PVector(tX, tY);
    tX = t.x; 
    tY = t.y;
  }
  
  
  void rotateView(){
  if (ui.pressed[65]) {
      rot-=0.1;
      println(rot);
    }   // a [65] L
    if (ui.pressed[68]) {
      rot+=0.1;
       println(rot);
    }   // d [68] R
  
  } 
  
  float floorMod(float a, float b) {
    return a - b * floor(a / b);
  }
}
