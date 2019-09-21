class Sceen {
  PGraphicsJava2D renderer;
  float  sMinX, sWidth;
  float  sMinY, sHeight;

  View[] views;
  Points points;


  Sceen(PGraphicsJava2D renderer) {
    this.renderer = renderer;
    views = new View[2];
    views[0] = new View(width*0.0, height*0.0, width*0.50, height*50, true);
    views[1] = new View(width*0.50, height*0.10, width*0.4, height*0.4, true);
    points = new Points();
  
  }

  void render() {
    if (ui.mPressed) {
      for (int i=0;i<views.length;i++){
      
      }
      
      points.addPointAt(new PVector(mouseX, mouseY));
      
      
    }

    if (ui.mRelesed) {
      ui.setMPressed(false);
    }

    // draw object to graphic 
    views[0].render(renderer,points);
    views[1].render(renderer,points);

    views[0].renderBoundry();
    views[1].renderBoundry();
  }

  void boundBoundry(PVector pos) {
    if (pos.x<sMinX) pos.x = sMinX;
    if (pos.y<sMinY) pos.y = sMinY;
    if (pos.x>sMinX+sWidth) pos.x = sMinX+sWidth;
    if (pos.y>sMinY+sHeight) pos.y = sMinY+sHeight;
  }
}
