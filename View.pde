class View {
  float  vX, vWidth;
  float  vY, vHeight;
  float tX, tY;
  color c;
  PGraphicsJava2D rendererSceen;
  boolean focus;
  Sceen sceen;

  View(Sceen sceen, color c) {
    this.sceen = sceen;
    this.c=c;
    vX =0;
    vY =0;
    vWidth = width;
    vHeight = height;
    tX = 0; 
    tY = 0 ;
  }

  View(Sceen sceen, float vX, float vY, float  vWidth, float vHeight, color c) {
    this.sceen = sceen;
    this.c=c;
    this.vX= vX ;
    this.vY =vY;
    this.vWidth = vWidth;
    this.vHeight = vHeight;
    tX = 0; 
    tY = 0 ;
  }

  //  --- MOUSE ---

  PVector getMouseCoordsFor(float mx, float my) {
    float xM = mx-vX-tX;
    float yM = my-vY-tY;
    //return new PVector(xM,yM);
    return sceenWrap( new PVector(xM, yM));
  }

  // TODO -- need to render screen with MOD on x and width for VIEW width
  void render(PGraphicsJava2D rendererSceen, Points points) {
    this.rendererSceen = rendererSceen;

    for (int i=0; i<points.pointList.size(); i++) {
      renderObjectClipedAt(points.pointList.get(i));
    }
  }

  void renderObjectClipedAt(Point point) {
    rendererSceen.clip(vX, vY, vWidth, vHeight);
    pushStyle();
    noFill();
    stroke(orange);
    PVector vPos = new PVector(vX+tX, vY+tY);
    rect(vPos.x, vPos.y, sceen.sWidth, sceen.sHeight);
    popStyle();
    VeiwToOrigin(point);
    rendererSceen.noClip();
  }

  void VeiwToOrigin(Point point) {
    //rendererSceen.pushMatrix();
    // Translate coordX+vX,coordY+vY

   
    PVector vPos = new PVector(tX+point.p.x, tY+point.p.y);
    vPos = sceenWrap(vPos);
   
    // rendererSceen.translate(vPos.x, vPos.y);



    rendererSceen.pushStyle();
    rendererSceen.noStroke();
    rendererSceen.fill(c);
    rendererSceen.ellipse(vX+vPos.x, vY+vPos.y, 5, 5);
    rendererSceen.popStyle();
    // rendererSceen.popMatrix();
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
    //screenWrap(t);
    tX = t.x; 
    tY = t.y;
  }

  //PVector sceenWrap(PVector pos ) {
  //  PVector newPos = new PVector();
  //  newPos.x = floorMod(pos.x, sceen.sWidth); newPos.y = floorMod(pos.y, sceen.sHeight);
  //  return newPos;
  //}

  PVector viewWrap(PVector pos ) {
    PVector newPos = new PVector();
    newPos.x = floorMod(pos.x, vWidth); 
    newPos.y = floorMod(pos.y, vHeight);
    return newPos;
  }
  
    PVector sceenWrap(PVector pos ) {
    PVector newPos = new PVector();
    newPos.x = floorMod(pos.x, sceen.sWidth); 
    newPos.y = floorMod(pos.y, sceen.sHeight);
    
    //print("pos.y "+pos.y+" "); 
    //print("newPos.y "+newPos.y+" "); 
    //print("sHeight "+sceen.sHeight+" "); 
    //println();
    
    return newPos;
  }

  float floorMod(float a, float b) {
    return a - b * floor(a / b);
  }
}
