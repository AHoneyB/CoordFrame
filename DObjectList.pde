class DObjectList {

  ArrayList<DObject> objList;
  ArrayList<DObject> selectedPoints;
  float sensivity = 5;

  DObjectList() {
    objList = new ArrayList<DObject>();
    selectedPoints = new ArrayList<DObject>();
  }

  void addPointAt(PVector pos) {
    objList.add(new DObject(pos));
  }


  void deletedSelected() {
    if (objList.size()>=1) {
      for (int i=objList.size()-1; i>=0; i--) {

        if (objList.get(i).selected) {
          objList.remove(i);
        }
      }
    }
  }


  boolean testPointsforSelected(PVector mC) {
    boolean selected = false;
    for (int i=0; i<objList.size(); i++) {
      DObject point = objList.get(i);
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
