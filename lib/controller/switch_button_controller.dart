import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class SwitchButtonController extends GetxController {
  var selectedCategory = 'Personal'.obs;
  RxBool suggest = false.obs;
  TextEditingController textController = TextEditingController();

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void checkboxState(bool checkstate) {
    suggest.value = checkstate;
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
