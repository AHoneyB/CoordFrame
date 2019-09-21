class View {
  float  vX, vWidth;
  float  vY, vHeight;
  float tx, ty;
  boolean origin;
  color c;
  PGraphicsJava2D rendererSceen;

  View(boolean origin,color c) {
    this.origin = origin;
    this.c=c;
    vX =0;
    vY =0;
    vWidth = width;
    vHeight = height;
  }

  View(float vX, float vY, float  vWidth, float vHeight,color c, boolean origin ) {
    this.origin = origin;
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
      renderObjectCliipedAt(points.pointList.get(i));
    }
  }

  void renderObjectCliipedAt(Point point) {
   
    if (origin) {
      rendererSceen.clip(vX, vY, vWidth, vHeight);
      VeiwToOrigin(point);
       rendererSceen.noClip();
    } else {
      rendererSceen.clip(vX, vY, vWidth, vHeight);
      point.pointRender(rendererSceen,c);
      rendererSceen.noClip();
    }

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
    rect(vX, vY, vWidth, vHeight);
    popStyle();
  }
  
  boolean mouseInViewBoundry(float x,float y){
    return (x>vX && x<(vX+vWidth) && y>vY && y<(vY+vHeight));
  }
}
