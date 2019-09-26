class ButtonPanel {

  ArrayList<Button> buttonList;
  UI ui;
  int lastedPress;

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
      Button l = buttonList.get(lastedPress);
      if (b.pushed()) {
         b.toggle();
        if (lastedPress!=i && !b.toggleAble) {
          l.selected = false;
          lastedPress =i;
          b.toggle();
        }
      } // End Pushed
    } //End loop
  }
}
