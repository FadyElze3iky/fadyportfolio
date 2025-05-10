import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetToKnowMeController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController();

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
