class Sceen {

  PGraphicsJava2D renderer;
  Rectangle rect;
  View[] views;
  DObjectList points;
  Button drawPointButton;
  Button deletePointButton;
  Button saveButton;
  Button loadButton;
  Button velocityButton;
  DObject lastSelected= null;
  UI ui;

  Sceen(PGraphicsJava2D renderer, UI ui) {

    this.ui =ui;
    this.renderer = renderer;
    rect = new Rectangle(0, 0, 400, 400);
    // BUTTONS
    drawPointButton = new Button( ui, new Rectangle(5, 5, 50, 50), red);
    deletePointButton = new Button( ui, new Rectangle(5, 55, 50, 50), orange);
    saveButton = new Button( ui, new Rectangle(5, 105, 50, 50), green);
    velocityButton = new Button( ui, new Rectangle(5, 155, 50, 50), blue);
    drawPointButton.selected = true; 

    // VIEWS
    views = new View[2];
    views[0] = new View(this, new Rectangle(100, 10, 200, 200), black);
    views[1] = new View(this, new Rectangle(100, 220, 600, 500), blue);

    points = new DObjectList();
  }

  void buttonrender() {
    drawPointButton.mouseButtonControl();
    if (drawPointButton.selected) deletePointButton.selected =false;

    if (!drawPointButton.selected)
      deletePointButton.mouseButtonControl();


    drawPointButton.renderButton();
    deletePointButton.renderButton();
    saveButton.mouseButtonControl();
    saveButton.renderButton();
    velocityButton.mouseButtonControl();
    velocityButton.renderButton();
  }

  // MAIN DRAW SCEEN 
  void render() {

    ArrayList<DObject> selectedPoints;

    // DRAW BUTTONS
    buttonrender();

    // DRAW VIEWS
    for (int i=0; i<views.length; i++) { 
      if (views[i].mouseInViewBoundry(mouseX, mouseY)) {
        views[i].focus =true;

        // MOUSE PRESSED
        if (ui.mPressed) {
          PVector mC = views[i].getMouseCoordsFor(mouseX, mouseY);
     
          // ADD VELOCITY VECTOR
          if (ui.pressed[16] && lastSelected!=null) // [16] = SHIFT
          {
            if (velocityButton.selected && !drawPointButton.selected)
            { 
              lastSelected.setVelocity((mC.sub(lastSelected.pos)));
            }
          } else {

            // SELECT OBJECT
            selectedPoints = points.testPointsforSelected(mC);
            if (selectedPoints.size()>0) {
              lastSelected = selectedPoints.get(selectedPoints.size()-1);
            }
            // ADD OBJECT
            if (drawPointButton.selected) {
              if (!ui.pressed[81]) {
                if (selectedPoints.size()<=0) {
                  points.addPointAt(new PVector(mC.x, mC.y));
                }
              } else {
                if (lastSelected!=null) 
                  lastSelected.setPointAt(mC);
              }
            } 
            if (deletePointButton.selected) {
              points.deletedSelected();
            }
          }
        } // END OF MOUSE PRESSED
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
      views[i].renderObjects(renderer, points);
      views[i].renderBoundry();
    } // End of Render all views
  }
}
