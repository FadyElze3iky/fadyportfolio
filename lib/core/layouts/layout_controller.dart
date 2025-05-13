import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  final RxBool isNavbarVisible = true.obs;
  final ScrollController scrollController = ScrollController();
  double lastScrollPosition = 0;

  void onScroll(double currentPosition) {
    if (currentPosition > lastScrollPosition) {
      // Scrolling down
      if (isNavbarVisible.value) {
        isNavbarVisible.value = false;
      }
    } else {
      // Scrolling up
      if (!isNavbarVisible.value) {
        isNavbarVisible.value = true;
      }
    }
    lastScrollPosition = currentPosition;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
