class Sceen {

  PGraphicsJava2D renderer;
  float  sMinX, sWidth;
  float  sMinY, sHeight;

  View[] views;
  Points points;


  Sceen(PGraphicsJava2D renderer) {
    this.renderer = renderer;
    sMinX= -2000; sMinY =-2000;
    sWidth = 4000; sHeight = 4000;
    views = new View[2];
    views[0] = new View(width*0.10, height*0.10, width*0.30, height*0.30, black);
    views[1] = new View(width*0.50, height*0.5, width*0.4, height*0.45, blue);
    points = new Points();
  }
  
  

  void render() {
  // Render all views
    
  
  
    for (int i=0; i<views.length; i++) {
      if (views[i].mouseInViewBoundry(mouseX, mouseY)) {
        views[i].focus =true;
        if (ui.mPressed) {
          PVector mouseCoords = views[i].getMouseCoordsFor(mouseX,mouseY);
          points.addPointAt(new PVector(mouseCoords.x,mouseCoords.y));
        }
      } else {
        views[i].focus =false;
      }
  // End of Render all views

      if (ui.mRelesed) {
        ui.setMPressed(false);
      }
      
      // draw object to graphic 
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
