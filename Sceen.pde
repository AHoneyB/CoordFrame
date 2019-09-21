class Sceen {
  PGraphicsJava2D renderer;
  float  sMinX, sWidth;
  float  sMinY, sHeight;

  View[] views;
  Points points;


  Sceen(PGraphicsJava2D renderer) {
    this.renderer = renderer;
    views = new View[2];
    views[0] = new View(width*0.10, height*0.10, width*0.30, height*0.30, black, true);
    views[1] = new View(width*0.50, height*0.5, width*0.4, height*0.45,blue,  true);
    points = new Points();
  }

  void render() {
    if (ui.mPressed) {
      for (int i=0; i<views.length; i++) {
        if (views[i].mouseInViewBoundry(mouseX, mouseY)){
        if (views[i].origin){
        points.addPointAt(new PVector(mouseX-views[i].vX, mouseY-views[i].vY));
        } 
        else {
          points.addPointAt(new PVector(mouseX, mouseY));
        }
        
        }
      }
    }

    if (ui.mRelesed) {
      ui.setMPressed(false);
    }

    // draw object to graphic 
    for (int i=0; i<views.length; i++) {
      views[i].render(renderer, points);
      views[i].renderBoundry();
    }
  }

  void boundBoundry(PVector pos) {
    if (pos.x<sMinX) pos.x = sMinX;
    if (pos.y<sMinY) pos.y = sMinY;
    if (pos.x>sMinX+sWidth) pos.x = sMinX+sWidth;
    if (pos.y>sMinY+sHeight) pos.y = sMinY+sHeight;
  }
}
