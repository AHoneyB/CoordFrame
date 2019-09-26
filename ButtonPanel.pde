class ButtonPanel {

  ArrayList<Button> buttonList;
  UI ui;
  int currentPress;

  ButtonPanel(UI ui) {
    this.ui = ui;
    buttonList = new ArrayList<Button>();
  }

  void add(Button b) {
    buttonList.add(b);
  }

  void buttonrender() {
    for (int i=0; i<buttonList.size(); i++) {
      buttonList.get(i).mouseFocus();
      buttonList.get(i).renderButton();
    }
  }

  void buttonPushed() {
    for (int i=0; i<buttonList.size(); i++) {
      Button b =buttonList.get(i); 
        if (b.pushed()){
          b.selected = true;
          currentPress =i;
        } else {
        if (i!=currentPress) b.selected = false;
        }
    }
  }
}
