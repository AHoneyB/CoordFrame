class UI{
  
  PApplet app;
  PVector mouseCoords;
  boolean mPressed, mRelesed;
  boolean[] pressed;

  UI(PApplet papp){
    app=papp;
    mouseCoords = new  PVector(mouseX,mouseY);
    getKeyPressed();
  }
  
  void setMPressed(boolean press){
    mPressed = press;
  }
  
   void setMRelesed(boolean relesed){
    mRelesed=relesed;
  }
  
  void getMouseCoords(){
    mouseCoords.x = mouseX;
    mouseCoords.y = mouseY;
  }
  
  void getKeyPressed(){
    this.pressed = getPressedArray();
  }


}
