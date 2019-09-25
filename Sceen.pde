class Sceen {

  PGraphicsJava2D renderer;
  Rectangle rect;
  View[] views;
  Points points;
  Button drawPoint;
  Button deletePoint;
  UI ui;

  Sceen(PGraphicsJava2D renderer, UI ui) {
    this.ui =ui;
    this.renderer = renderer;
    rect = new Rectangle(0, 0, 400, 400);
    // BUTTONS
    drawPoint = new Button( ui, new Rectangle(5, 5, 50, 50), orange);
    deletePoint = new Button( ui, new Rectangle(5, 55, 50, 50), red);
    drawPoint.selected = true; 
    views = new View[2];
    views[0] = new View(this, new Rectangle(100, 10, 200, 200), black);
    views[1] = new View(this, new Rectangle(100, 220, 400, 300), blue);

    points = new Points();
  }


  void render() {
    // Render all views
    drawPoint.mouseButtonControl();
    if (drawPoint.selected) deletePoint.selected =false;
    else deletePoint.selected =true;
    deletePoint.mouseButtonControl();
    if (deletePoint.selected) drawPoint.selected =false;
    else drawPoint.selected =true;
    
    drawPoint.renderButton();
    deletePoint.renderButton();

    for (int i=0; i<views.length; i++) { 
      if (views[i].mouseInViewBoundry(mouseX, mouseY)) {
        views[i].focus =true;
        if (ui.mPressed) {
          PVector mC = views[i].getMouseCoordsFor(mouseX, mouseY);
          points.testPointsforSelected(mC);

          if (drawPoint.selected) {
            if (!points.testPointsforSelected(mC)) {
              points.addPointAt(new PVector(mC.x, mC.y));
            }
          }

          if (deletePoint.selected) {
            points.deletedSelected();
          }
        } // end of mouse pressed
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
}
