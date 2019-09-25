class View {
  Rectangle viewRect;
  float tX, tY;
  float rot;
  PVector origin;
  color c;
  PGraphicsJava2D rendererSceen;
  boolean focus;
  Sceen sceen;

  View(Sceen sceen, color c) {
    this.sceen = sceen;
    this.c=c;
    tX =0; 
    tY =0;
    origin = new PVector(viewRect.x+sceen.rect.w/2+tX, viewRect.y+sceen.rect.h/2+tY);
    rot =0;
  }

  View(Sceen sceen, Rectangle viewRect, color c) {
    this.sceen = sceen;
    this.c=c;
    this.viewRect =viewRect;
    tX =0; 
    tY =0;
    origin = new PVector(viewRect.x+sceen.rect.w/2+tX, viewRect.y+sceen.rect.h/2+tY);
    rot =0;
  }

  //  --- MOUSE ---

  PVector getMouseCoordsFor(float mx, float my) {
    // TRANSFORM MOUSE COORDS
    float x= mx-origin.x;
    float y= my-origin.y;
    float xM =(cos(radians(rot))*x+sin(radians(rot))*y);
    float yM =(-sin(radians(rot))*x+cos(radians(rot))*y);

    return new PVector(xM, yM);
  }

  // DRAW SCEEN RECT
  void renderSceen(PGraphicsJava2D rendererSceen) {
    this.rendererSceen = rendererSceen;
    rendererSceen.clip(viewRect.x, viewRect.y, viewRect.w, viewRect.h);
    renderSceenRect();
    rendererSceen.noClip();
  }

  void renderSceenRect() {
    rendererSceen.pushMatrix();
    rendererSceen.translate(origin.x, origin.y);
    rendererSceen.rotate(radians(rot));

    pushStyle();
    noFill();
    stroke(orange);
    rect(-sceen.rect.w/2, -sceen.rect.h/2, sceen.rect.w, sceen.rect.h);
    popStyle();
    rendererSceen.popMatrix();
  }

  // DRAW POINTS
  void renderPoints(PGraphicsJava2D rendererSceen, Points points) {
    this.rendererSceen = rendererSceen;

    for (int i=0; i<points.pointList.size(); i++) {
      renderObjectClipedAt(points.pointList.get(i));
    }
  }

  void renderObjectClipedAt(Point point) {
    rendererSceen.clip(viewRect.x, viewRect.y, viewRect.w, viewRect.h);
    pointRender(point);
    rendererSceen.noClip();
  }

  void pointRender(Point point) {

    rendererSceen.pushMatrix();

    // TRANSLATE ORIGIN
    rendererSceen.translate(origin.x, origin.y);
    rendererSceen.rotate(radians(rot));



    rendererSceen.pushStyle();
    rendererSceen.noStroke();
    if (point.selected) {
      rendererSceen.fill(red);
    } else {
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
    rect(viewRect.x, viewRect.y, viewRect.w, viewRect.h);
    popStyle();
  }

  boolean mouseInViewBoundry(float x, float y) {
    return (x>viewRect.x && x<(viewRect.x+viewRect.w) && y>viewRect.y && y<(viewRect.y+viewRect.w));
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
    // MOVE COORDS
    origin.set(viewRect.x+sceen.rect.w/2+tX, viewRect.y+sceen.rect.h/2+tY);
  }


  void rotateView() {
    if (ui.pressed[65]) {
      rot-=0.5;
    }   // a [65] L
    if (ui.pressed[68]) {
      rot+=0.5;
    }   // d [68] R
  } 

  float floorMod(float a, float b) {
    return a - b * floor(a / b);
  }
}
