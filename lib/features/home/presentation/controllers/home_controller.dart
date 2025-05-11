import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final RxString _currentSection = 'home'.obs;
  final ScrollController scrollController = ScrollController();

  String get currentSection => _currentSection.value;

  void changeSection(String section) {
    _currentSection.value = section;
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
