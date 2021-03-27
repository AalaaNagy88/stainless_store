import 'package:get/state_manager.dart';

mixin SelectableControllerMixin on GetxController {
  List<int> selectedIndexes = [];
  RxBool isSelecting = RxBool();
  bool disableEditingWhenNoneSelected = true;
  int listLength = 0;

  /// Returns true if the id is selected
  bool isSelected(int i) {
    return selectedIndexes.contains(i);
  }

  /// Toggle all select.
  /// If there are some that not selected, it will select all.
  /// If not, it will deselect all.
  void toggleAll() {
    if (selectedIndexes.length == listLength) {
      deselectAll();
    } else {
      selectAll();
    }
  }

  /// Select all
  void selectAll() {
    isSelecting.value = true;
    selectedIndexes = List.generate(listLength, (index) {
      return index;
    });
  }

  /// Deselect all
  void deselectAll() {
    isSelecting.value = !disableEditingWhenNoneSelected;
    selectedIndexes.clear();
  }

  /// Toggle at index
  void toggle(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      selectedIndexes.add(index);
    }

    if (selectedIndexes.isEmpty && disableEditingWhenNoneSelected) {
      isSelecting.value = false;
    } else {
      isSelecting.value = true;
    }
  }

  /// Select at index
  void select(int index) {
    if (!selectedIndexes.contains(index)) {
      selectedIndexes.add(index);
    }
    isSelecting.value = true;
  }

  /// Deselect at index
  void deselect(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    }

    if (selectedIndexes.isEmpty && disableEditingWhenNoneSelected) {
      isSelecting.value = false;
    } else {
      isSelecting.value = true;
    }
  }
}
