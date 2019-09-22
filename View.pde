class View {
  float  vX, vWidth;
  float  vY, vHeight;
  float tx, ty;
  color c;
  PGraphicsJava2D rendererSceen;
  boolean focus;

  View(color c) {
    this.c=c;
    vX =0;
    vY =0;
    vWidth = width;
    vHeight = height;
  }

  View(float vX, float vY, float  vWidth, float vHeight,color c) {
    this.c=c;
    this.vX= vX ;
    this.vY =vY;
    this.vWidth = vWidth;
    this.vHeight = vHeight;
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
  
  PVector getVeiwMouseCoordsFor(float mx,float my){
   return new PVector(mouseX-vX, mouseY-vY);
  }

  void renderObjectClipedAt(Point point) {
      rendererSceen.clip(vX, vY, vWidth, vHeight);
      VeiwToOrigin(point);
      rendererSceen.noClip();
  }

  void VeiwToOrigin(Point point) {
    rendererSceen.pushMatrix();
    rendererSceen.translate(vX, vY);
    point.pointRender(rendererSceen,c);
    rendererSceen.popMatrix();
  }

  void renderBoundry() {
    pushStyle();
    noFill();
    stroke(red);
    if (focus) strokeWeight(3); else strokeWeight(1);
    rect(vX, vY, vWidth, vHeight);
    popStyle();
  }
  
  boolean mouseInViewBoundry(float x,float y){
    return (x>vX && x<(vX+vWidth) && y>vY && y<(vY+vHeight));
  }
  
  }
