class Selected {
  bool _selected;

  Selected(this._selected);

  void toggle() {
    this._selected = !_selected;
  }

  void setSelected(bool s) {
    this._selected = s;
  }
}

mixin Selectable {
  final Selected selectedState = Selected(false);

  bool get isSelected {
    return selectedState._selected;
  }

  void toggleSelection() {
    this.selectedState.toggle();
  }

  void setSelected(bool s) {
    selectedState.setSelected(s);
  }

  void select() {
    selectedState.setSelected(true);
  }

  void unselect() {
    selectedState.setSelected(false);
  }
}
