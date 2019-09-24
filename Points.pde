class Points {

  ArrayList<Point> pointList;

  Points() {
    pointList = new ArrayList<Point>();
  }

  void addPointAt(PVector pos) {
    pointList.add(new Point(pos));
  }

  boolean testPointsforSelected(PVector mC){
    boolean selected = false;
    for (int i=0;i<pointList.size();i++){
      Point point = pointList.get(i);
      if (point.distanceTo(mC)<1) {
        point.selected=true;
        selected =true;
      } else {
        point.selected=false;
      }
    }
    return selected;
  }

}
