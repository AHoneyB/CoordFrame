class Sceen {

  PGraphicsJava2D renderer;
  Rectangle rect;
  View[] views;
  Points points;
  Button drawPointButton;
  Button deletePointButton;
  Button saveButton;
  Button loadButton;
  UI ui;

  Sceen(PGraphicsJava2D renderer, UI ui) {
    this.ui =ui;
    this.renderer = renderer;
    rect = new Rectangle(0, 0, 400, 400);
    // BUTTONS
    drawPointButton = new Button( ui, new Rectangle(5, 5, 50, 50), red);
    deletePointButton = new Button( ui, new Rectangle(5, 55, 50, 50), orange);
    saveButton = new Button( ui, new Rectangle(5, 105, 50, 50), green);
    drawPointButton.selected = true; 

    // VIEWS
    views = new View[2];
    views[0] = new View(this, new Rectangle(100, 10, 200, 200), black);
    views[1] = new View(this, new Rectangle(100, 220, 600, 500), blue);

    points = new Points();
  }

  void buttonrender() {
    drawPointButton.mouseButtonControl();
    if (drawPointButton.selected) deletePointButton.selected =false;
    else deletePointButton.selected =true;
    deletePointButton.mouseButtonControl();
    if (deletePointButton.selected) drawPointButton.selected =false;
    else drawPointButton.selected =true;

    drawPointButton.renderButton();
    deletePointButton.renderButton();
    saveButton.mouseButtonControl();
    saveButton.renderButton();
  }

  void render() {
    
    // DRAW BUTTONS
    buttonrender();

    // DRAW VIEWS
    for (int i=0; i<views.length; i++) { 
      if (views[i].mouseInViewBoundry(mouseX, mouseY)) {
        views[i].focus =true;
        if (ui.mPressed) {
          PVector mC = views[i].getMouseCoordsFor(mouseX, mouseY);
          points.testPointsforSelected(mC);

          if (drawPointButton.selected) {
            if (!points.testPointsforSelected(mC)) {
              points.addPointAt(new PVector(mC.x, mC.y));
            }
          }

          if (deletePointButton.selected) {
            points.deletedSelected();
          }
        } // end of mouse pressed
      } else {
        views[i].focus =false;
      } // End of mouse in view
      

      if (views[i].focus) {
        views[i].translateView();
        views[i].rotateView();
      }

      if (ui.mRelesed) {
        ui.setMPressed(false);
      }

      // draw object to graphic 
      views[i].renderSceen(renderer);
      views[i].renderPoints(renderer, points);
      views[i].renderBoundry();
    } // End of Render all views
  }
}
