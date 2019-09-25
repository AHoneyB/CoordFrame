class View {
  Rectangle rect;
  float tX, tY;
  color c;
  PGraphicsJava2D rendererSceen;
  boolean focus;
  Sceen sceen;

  View(Sceen sceen, color c) {
    this.sceen = sceen;
    this.c=c;
    rect = new Rectangle(0,0,width,height);
    tX = 0; 
    tY = 0 ;
  }

  View(Sceen sceen, Rectangle rect, color c) {
    this.sceen = sceen;
    this.c=c;
    this.rect =rect;
    rect = new Rectangle(0,0,width,height);
    tX = 0; 
    tY = 0 ;
  }

  //  --- MOUSE ---

  PVector getMouseCoordsFor(float mx, float my) {
    float xM = mx-rect.x-tX;
    float yM = my-rect.y-tY;
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
    rect(rect.x, rect.y, sceen.rect.w, sceen.rect.h);
    popStyle();
  }

  void VeiwToOrigin(Point point) {
    rendererSceen.pushMatrix();
    // Translate coordX+vX,coordY+vY
     rendererSceen.translate(tX, tY);

    renderSceenRect();
    
    rendererSceen.pushStyle();
    rendererSceen.noStroke();
    if (point.selected){
      rendererSceen.fill(red);
    }
    else {
      rendererSceen.fill(c);
    }
    
    rendererSceen.ellipse(rect.x+point.p.x, rect.y+point.p.y, 10, 10);
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
    if (ui.pressed[87]) {
      tY--;
    }   // w
    if (ui.pressed[83]) {
      tY++;
    }   // s
    if (ui.pressed[65]) {
      tX--;
    }   // a
    if (ui.pressed[68]) {
      tX++;
    }   // d
    PVector t=new PVector(tX, tY);
    tX = t.x; 
    tY = t.y;
  }

  float floorMod(float a, float b) {
    return a - b * floor(a / b);
  }
}
