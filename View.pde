class View {
  float  vX, vWidth;
  float  vY, vHeight;
  float tX, tY;
  color c;
  PGraphicsJava2D rendererSceen;
  boolean focus;

  View(color c) {
    this.c=c;
    vX =0;
    vY =0;
    vWidth = width;
    vHeight = height;
    tX = 0; 
    tY = 0 ;
  }

  View(float vX, float vY, float  vWidth, float vHeight, color c) {
    this.c=c;
    this.vX= vX ;
    this.vY =vY;
    this.vWidth = vWidth;
    this.vHeight = vHeight;
    tX = 0; 
    tY = 0 ;
  }

  void render(PGraphicsJava2D rendererSceen, Points points) {
    this.rendererSceen = rendererSceen;
    renderObjects(points);
  }

  void renderObjects(Points points) {
    for (int i=0; i<points.pointList.size(); i++) {
      renderObjectClipedAt(points.pointList.get(i));
    }
  }

  PVector getMouseCoordsFor(float mx, float my) {
    return new PVector(mx-vX-tX, my-vY-tY);
  }

  void renderObjectClipedAt(Point point) {
    rendererSceen.clip(vX, vY, vWidth, vHeight);
    VeiwToOrigin(point);
    rendererSceen.noClip();
  }

  void VeiwToOrigin(Point point) {
    rendererSceen.pushMatrix();
    // Translate coordX+vX,coordY+vY
    rendererSceen.translate(vX+tX, vY+tY);
    point.pointRender(rendererSceen, c);
    rendererSceen.popMatrix();
  }

  void renderBoundry() {
    pushStyle();
    noFill();
    stroke(red);
    if (focus) strokeWeight(3); 
    else strokeWeight(1);
    rect(vX, vY, vWidth, vHeight);
    popStyle();
  }

  boolean mouseInViewBoundry(float x, float y) {
    return (x>vX && x<(vX+vWidth) && y>vY && y<(vY+vHeight));
  }

  void translateView() {
    if (ui.pressed[87]) {
       tY++;
    }   // w
    if (ui.pressed[83]) {
      tY--;
    }   // s
    if (ui.pressed[65]) {
      tX++;
    }   // a
    if (ui.pressed[68]) {
      tX--;
    }   // d
  }
}
