class View {
  float  vX, vWidth;
  float  vY, vHeight;
  float tx, ty;
  boolean origin;
  PGraphicsJava2D rendererSceen;

  View(boolean origin) {
    this.origin = origin;
    vX =0;
    vY =0;
    vWidth = width;
    vHeight = height;
  }

  View(float vX, float vY, float  vWidth, float vHeight, boolean origin ) {
    this.origin = origin;
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
      VeiwToOrigin(point);
    } else {
       rendererSceen.clip(vX, vY, vWidth, vHeight);
      point.pointRender(rendererSceen);
        rendererSceen.noClip();
    }

  }

  void VeiwToOrigin(Point point) {
    rendererSceen.pushMatrix();
    rendererSceen.translate(-vX, -vY);
    point.pointRender(rendererSceen);
    rendererSceen.popMatrix();
  }

  void renderBoundry() {
    pushStyle();
    noFill();
    stroke(red);
    rect(vX, vY, vWidth, vHeight);
    popStyle();
  }
}
