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
  }

  void setupButtonPanel() {
    addPointButton = new Button( ui, new Rectangle(5, 5, 50, 50), red);
    deletePointButton = new Button( ui, new Rectangle(5, 55, 50, 50), orange);
    selectButton = new Button( ui, new Rectangle(5, 105, 50, 50), green);
    velocityButton = new Button( ui, new Rectangle(5, 155, 50, 50), blue);
    addPointButton.selected = true; 
    selectButton.toggleAble = true; 
    buttonPanel.add(addPointButton);
    buttonPanel.add(deletePointButton);
    buttonPanel.add(selectButton);
    buttonPanel.add(velocityButton);
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
          if (ui.pressed[16] && lastSelected!=null) // [16] = SHIFT
          {
            if (velocityButton.selected)
            { 
              lastSelected.setVelocity((mC.sub(lastSelected.pos)));
            }
          }

          // SELECT OBJECT
          if (selectButton.selected || deletePointButton.selected) {
           if (ui.pressed[16] && lastSelected!=null ) {
           
                  lastSelected.setPointAt(mC);
            }
            selectedPoints = points.testPointsforSelected(mC);
            if (selectedPoints.size()>0) {
              lastSelected = selectedPoints.get(selectedPoints.size()-1);
            }

            // DELETE OBJECT
            if (deletePointButton.selected) {
              points.deletedSelected();
            }
          }

          // ADD OBJECT
          if (addPointButton.selected) {
            if (selectedPoints==null && !points.closeTo(mC)) {
              points.addPointAt(new PVector(mC.x, mC.y));
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
