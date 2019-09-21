class Veiw {
  float  vX, vWidth;
  float  vY, vHeight;

  Veiw() {
    vX =0;
    vY =0;
    vWidth = width;
    vHeight = height;
  }

  Veiw(float vX, float vY, float  vWidth, float vHeight ) {
    this.vX= vX ;
    this.vY =vY;
    this.vWidth = vWidth;
    this.vHeight = vHeight;
  }
  
  void clipSceen(PGraphicsJava2D rendererSceen){
    rendererSceen.clip(vX,vY,vWidth,vHeight);
  }

  boolean inBounds(PVector p) {
    return (p.x>=vX && p.y>=vY && p.x<=vX+vWidth && p.y<=vY+vHeight);
  }

  void renderBoundry() {
    pushStyle();
    noFill();
    stroke(red);
    rect(vX,vY,vWidth,vHeight);
    popStyle();
  }

  void boundToBoundry(PVector p) {
    if (p.x<vX) p.x = vX;
    if (p.y<vY) p.y = vY;
    if (p.x>vX+vWidth) p.x = vX+vWidth;
    if (p.y>vY+vHeight) p.y = vY+vHeight;
  }
}
