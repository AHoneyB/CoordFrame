class Points{

  ArrayList<Point> pointList;
  Veiw veiw;

  Points(Veiw veiw){
    this.veiw  = veiw;
    pointList = new ArrayList<Point>();
  
  }

  void addPointAt(PVector pos){
    pointList.add(new Point(pos));
  }
  
   void renderPoints(PGraphicsJava2D rendererSceen){
    for (int i=0;i<pointList.size();i++){
      pointList.get(i).renderPoint(rendererSceen, veiw);
    }
  }
  
  
}
