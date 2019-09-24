class Sceen {

  PGraphicsJava2D renderer;
  float  sX, sWidth;
  float  sY, sHeight;

  View[] views;
  Points points;


  Sceen(PGraphicsJava2D renderer) {
    this.renderer = renderer;
    sX= 0; sY =0;
    sWidth = 400; sHeight =400;
    views = new View[2];
   views[0] = new View(this, 10, 10, 200, 200, black);
    views[1] = new View(this,10, 220, 400, 400, blue);
   
    points = new Points();
  }
  
 
  void render() {
  // Render all views
    for (int i=0; i<views.length; i++) { 
      if (views[i].mouseInViewBoundry(mouseX, mouseY)) {
        views[i].focus =true;
        if (ui.mPressed) {
          PVector mC = views[i].getMouseCoordsFor(mouseX,mouseY);
          
          points.addPointAt(new PVector(mC.x,mC.y));
        }
      } else {
        views[i].focus =false;
      }
  // End of Render all views

      if (views[i].focus)
        views[i].translateView();

      if (ui.mRelesed) {
        ui.setMPressed(false);
      }
      
      // draw object to graphic 
      views[i].render(renderer, points);
      views[i].renderBoundry();
    }
  }

  //void boundBoundry(PVector pos) {
  //  if (pos.x<sX) pos.x = sX;
  //  if (pos.y<sY) pos.y = sY;
  //  if (pos.x>sX+sWidth) pos.x = sX+sWidth;
  //  if (pos.y>sY+sHeight) pos.y = sY+sHeight;
  //}
}
