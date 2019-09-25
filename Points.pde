class Points {

  ArrayList<Point> pointList;
  ArrayList<Point> selectedPoints;
  float sensivity = 5;

  Points() {
    pointList = new ArrayList<Point>();
    selectedPoints = new ArrayList<Point>();
  }

  void addPointAt(PVector pos) {
    pointList.add(new Point(pos));
  }
  
  
  void deletedSelected(){
     if (pointList.size()>=1) {
     for (int i=pointList.size()-1;i>=0;i--){
 
     if (pointList.get(i).selected){
       pointList.remove(i);
     }
   }
     }
   
  }

  boolean testPointsforSelected(PVector mC){
    boolean selected = false;
    for (int i=0;i<pointList.size();i++){
      Point point = pointList.get(i);
      if (point.distanceTo(mC)<sensivity) {
        point.selected=true;
        selected =true;
      } else {
        point.selected=false;
      }
    }
    return selected;
  }

}
