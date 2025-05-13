import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/layouts/layout_controller.dart';

class HomeController extends GetxController {
  final RxString _currentSection = 'home'.obs;
  late final LayoutController layoutController;

  String get currentSection => _currentSection.value;

  @override
  void onInit() {
    super.onInit();
    // Get the scroll controller from LayoutController
    layoutController = Get.find<LayoutController>();
  }

  void changeSection(String section) {
    _currentSection.value = section;
    // Get current scroll position
    final currentPosition = layoutController.scrollController.position.pixels;
    // Add a small delay to allow hover animation to play
    Future.delayed(const Duration(milliseconds: 100), () {
      // Animate to top with a more noticeable curve
      layoutController.scrollController.animateTo(
        currentPosition > 0 ? 0 : 100, // If at top, scroll down a bit first
        duration: const Duration(milliseconds: 800), // Longer duration
        curve: Curves.easeInOutCubic, // More pronounced curve
      );
      layoutController.isNavbarVisible.value = true;
    });
  }

  @override
  void onClose() {
    // Don't dispose the scroll controller here since it's managed by LayoutController
    super.onClose();
  }
}
