class Points {

  ArrayList<Point> pointList;

  Points() {
    pointList = new ArrayList<Point>();
  }

  void addPointAt(PVector pos) {
    pointList.add(new Point(pos));
  }

}
