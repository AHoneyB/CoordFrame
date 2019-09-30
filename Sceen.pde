class Sceen {

  PGraphicsJava2D renderer;
  Rectangle rect;
  View[] views;
  DObjectList points;
  DObject lastSelected= null;
  UI ui;
  ButtonPanel buttonPanel;
  Button addPointButton ;
  Button deletePointButton ;
  Button selectButton ;
  Button velocityButton ;
  Button moveButton ;
  float time;

  Sceen(PGraphicsJava2D renderer, UI ui) {
    this.ui =ui;
    this.renderer = renderer;
    rect = new Rectangle(0, 0, 400, 400);
    // BUTTONS
    buttonPanel = new ButtonPanel(ui);
    setupButtonPanel();
    // VIEWS
    views = new View[2];
    views[0] = new View(this, new Rectangle(100, 10, 200, 200), black);
    views[1] = new View(this, new Rectangle(100, 220, 600, 500), blue);

    points = new DObjectList();
    time =0;
  }

  void setupButtonPanel() {
    addPointButton = new Button( ui, new Rectangle(5, 5, 50, 50), red);
    deletePointButton = new Button( ui, new Rectangle(5, 55, 50, 50), orange);
    selectButton = new Button( ui, new Rectangle(5, 105, 50, 50), green);
    velocityButton = new Button( ui, new Rectangle(5, 155, 50, 50), blue);
    moveButton = new Button( ui, new Rectangle(5, 205, 50, 50), purple);

    addPointButton.selected = true; 
    selectButton.toggleAble = true; 
    buttonPanel.add(addPointButton);
    buttonPanel.add(deletePointButton);
    buttonPanel.add(selectButton);
    buttonPanel.add(velocityButton);
    buttonPanel.add(moveButton);
  }



  // MAIN DRAW SCEEN 
  void render() {

    ArrayList<DObject> selectedPoints = null;

    // DRAW BUTTONS
    buttonPanel.buttonrender();
    buttonPanel.buttonPushed();

    // DRAW VIEWS
    for (int i=0; i<views.length; i++) { 
      if (views[i].mouseInViewBoundry(mouseX, mouseY)) {
        views[i].focus =true;

        // MOUSE PRESSED
        if (ui.mPressed) {
          PVector mC = views[i].getMouseCoordsFor(mouseX, mouseY);

          // ADD VELOCITY VECTOR
          if (ui.mRight && lastSelected!=null) 
          {
            if (velocityButton.selected)
            { 
              lastSelected.setVelocity((mC.sub(lastSelected.pos)));
            }
          }

          // Move object to new selected point
          if (selectButton.selected || deletePointButton.selected) {
            if ( ui.pressed[16] && lastSelected!=null && !velocityButton.selected) {
              lastSelected.setPointAt(mC);
            }

            // Set relative velocity KEY [86] = V
            if ( ui.pressed[86] && lastSelected!=null && !velocityButton.selected) {

              points.setRelVelocities( lastSelected);
            }
            // SELECT CLOSEST POINTS
            selectedPoints = points.testPointsforSelected(mC);
            views[i].setSelectedPoints(selectedPoints);
            if (selectedPoints.size()>0) {
              lastSelected = selectedPoints.get(selectedPoints.size()-1);
            }

            // DELETE OBJECT
            if (deletePointButton.selected) {
              points.deletedSelected();
            }
          }

          // ADD POINT
          if (addPointButton.selected) {
            if (selectedPoints==null && !points.closeTo(mC)) {
              points.addPointAt(new PVector(mC.x, mC.y));
            }
          }
        } // END OF MOUSE PRESSED
      } // END IN VIEW FOCUS
      else {      
        views[i].focus =false;
      } // End of mouse in view

      // MOVE OBJECT 
      if (moveButton.selected) {
        points.objectsDoAddList();
        // Set object to center of view KEY [67] = C
            if ( ui.pressed[67] && lastSelected!=null) {
              //println("lastSelected.pos = "+lastSelected.pos.x+","+lastSelected.pos.y);
              views[i].setTransTo(lastSelected.pos);
          
            }
      }


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

    time ++;
    if (time>=MAX_FLOAT) time=0;
  }
}
