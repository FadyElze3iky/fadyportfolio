import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoCardController extends GetxController
    with SingleGetTickerProviderMixin {
  // Tracks hover state
  RxBool isHovered = false.obs;

  // Animation controller and animations
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> shadowAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    shadowAnimation = Tween<double>(begin: 0.08, end: 0.2).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
  }

  void handleHover(bool hover) {
    isHovered.value = hover;
    if (hover) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
