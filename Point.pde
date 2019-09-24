class Point {

  PVector p;
  boolean selected;

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

  float distanceTo(PVector q) {
    float dx =p.x-q.x;
    float dy =p.y-q.y;
    return sqrt(dx*dx+dy*dy);
  }
}
