class Veiw {
  float  vMinX, vMinY;
  float  vMaxX, vMaxY;

  Veiw() {
    vMinX =0;
    vMinY =0;
    vMaxX = width;
    vMaxY = height;
  }

  Veiw(float vMinX, float vMinY, float  vMaxX, float vMaxY ) {
    this.vMinX= vMinX ;
    this.vMinY =vMinY;
    this.vMaxX = vMaxX;
    this.vMaxY = vMaxY;
  }

  boolean inBounds(PVector p) {
    return (p.x>=vMinX && p.y>=vMinY && p.x<=vMaxX && p.y<=vMaxY);
  }

  void renderBoundry() {
    pushStyle();
    noFill();
    stroke(red);
    rect(vMinX, vMinY, vMaxX-vMinX, vMaxY-vMinY);
    popStyle();
  }

  void boundToBoundry(PVector p) {
    if (p.x<vMinX) p.x = vMinX;
    if (p.y<vMinY) p.y = vMinY;
    if (p.x>vMaxX) p.x = vMaxX;
    if (p.y>vMaxY) p.y = vMaxY;
  }
}
