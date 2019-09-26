class DObjectList {

  ArrayList<DObject> objList;
  ArrayList<DObject> selectedPoints;
  float sensivity = 3;

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


  ArrayList<DObject> testPointsforSelected(PVector mC) {
    selectedPoints.clear();
    for (int i=0; i<objList.size(); i++) {
      DObject point = objList.get(i);
      if (point.distanceTo(mC)<sensivity) {
        point.selected=true;
        selectedPoints.add(point);
      } else {
        point.selected=false;
      }
    }
    return selectedPoints;
  }
}
