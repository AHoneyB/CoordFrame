class UI{
  
  PApplet app;
  PVector mouseCoords;
  boolean mPressed, mRelesed;
  boolean mLeft, mRight;
  boolean[] pressed = new boolean[256];

  UI(PApplet papp){
    app=papp;
    mouseCoords = new  PVector(mouseX,mouseY);
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
  
  }
  
}
