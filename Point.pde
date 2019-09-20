class Point {

  Veiw veiw;
  PVector p;
  color c;

  Point() {
    p = new PVector(9, 9);
    c = color(black);
  }

  Point(float x, float y) {
    p = new PVector(x, y);
    c = color(black);
  }

  Point(PVector pv) {
    p = pv;
    c = color(black);
  }

  void setcolor(color c) {
    this.c = c;
  }

  void setPointAt(PVector pos) {
    p=pos;
  }

  void setVeiw() {
  }

  void renderPoint(Veiw veiw) {
    this.veiw = veiw;
    if (veiw.inBounds(p)) {
      pushStyle();
      noStroke();
      fill(c);
      ellipse(p.x, p.y, 5, 5);
      popStyle();
    }
  }
}
