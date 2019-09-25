class Button {

  Rectangle rectButton;
  String stringButton;
  boolean focus, selected;
  UI ui;
  int msTimeI;
  color c;


  Button(UI ui, Rectangle rectButton) {
    this.rectButton = rectButton;
    this.ui = ui;
    selected =false;
    msTimeI = millis();
    c = black;
  }
  
  Button(UI ui, Rectangle rectButton, color c) {
    this.rectButton = rectButton;
    this.ui = ui;
    this.c=c;
    selected =false;
    msTimeI = millis();
  }


  boolean overButton(float mx, float my) {
    return (mx>rectButton.x && my>rectButton.y && 
      mx<rectButton.x+rectButton.w &&  my<rectButton.y+rectButton.h);
  }

  void renderButton() {
    pushed();
    if (overButton(mouseX, mouseY)) { 
      focus = true;
    } else {
      focus = false;
    }
    pushMatrix();
    translate(rectButton.x, rectButton.y);
    pushStyle();
    stroke(black);
    fill(backGround);
    rect(0, 0, rectButton.w, rectButton.h);
    if (selected) {
      fill(c);
      rect(3, 3, rectButton.w-6, rectButton.h-6);
    } else {
      noFill();
    }

    if (focus) {
      strokeWeight(3);
    } else {
      strokeWeight(1);
    }

    
    popStyle();
    popMatrix();
  }

  void pushed() {
    if (focus && ui.mPressed) {
      if (!selected && (millis()-msTimeI)>200) {
        msTimeI = millis();
        selected =true;
      }  
      if (selected && (millis()-msTimeI)>200) {
        msTimeI = millis();
        selected =false;
      }
    }
  }
  
  boolean getSelected(){
    return selected;
  }
  
  
}
