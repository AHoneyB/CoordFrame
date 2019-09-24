class Point {

  PVector p;


  Point() {
    p = new PVector(0, 0);
  }

  Point(float x, float y) {
    p = new PVector(x, y);
  }

  Point(PVector pv) {
    p = pv;
  }

  void setPointAt(PVector pos) {
    p=pos;
  }
}
