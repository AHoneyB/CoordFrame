class Sceen {
  PGraphicsJava2D renderer;
  float  sMinX, sMinY;
  float  sMaxX, sMaxY;

  Veiw veiw1, veiw2;
  Points points1;
  Points points2;

  Sceen(PGraphicsJava2D renderer) {
    this.renderer = renderer;
    veiw1 = new Veiw(width*0.10, height*0.10, width*0.4, height*0.4);
    veiw2 = new Veiw(width*0.50, height*0.10, width*0.9, height*0.9);
    points1 = new Points(veiw1);
    points2 = new Points(veiw2);
  }

  void render() {
    if (ui.mPressed) {
      points1.addPointAt(new PVector(mouseX, mouseY));
      points2.addPointAt(new PVector(mouseX, mouseY));
    }

    if (ui.mRelesed) {
      ui.setMPressed(false);
    }

    points1.renderPoints(renderer);
    points2.renderPoints(renderer);

    veiw1.renderBoundry();
    veiw2.renderBoundry();
  }
}
