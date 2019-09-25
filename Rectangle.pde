class Rectangle {

  float x,y,w,h;

  Rectangle(float x, float y, float w, float h){
    this.x =x;
    this.y =y;
    this.w =w;
    this.h =h;
  }

  boolean interescts(Rectangle other){
   return  (!(other.x+other.w>this.x || this.x+this.w>other.x 
   || other.y+other.h>this.y || this.y+this.h>other.y));
  }

}
