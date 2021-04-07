import 'package:get/get.dart';

mixin SelectableControllerMixin on GetxController {
  RxList<int> selectedIndexes = <int>[].obs;
  RxBool isSelecting = false.obs;
  bool disableEditingWhenNoneSelected = true;
  int listLength = 0;

  bool isSelected(int i) {
    return selectedIndexes.contains(i);
  }

  void toggleAll() {
    if (selectedIndexes.length == listLength) {
      deselectAll();
    } else {
      selectAll();
    }
  }

  void selectAll() {
    isSelecting.value = true;
    selectedIndexes.assignAll(List.generate(listLength, (index) {
      return index;
    }));
    selectedIndexes.toSet().toList();
  }

  void deselectAll() {
    isSelecting.value = !disableEditingWhenNoneSelected;
    selectedIndexes.clear();
  }

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
}
