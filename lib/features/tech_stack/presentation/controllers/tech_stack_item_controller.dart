import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechStackItemController extends GetxController {
  final isHovered = false.obs;
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> shadowAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: Get.find(),
      duration: const Duration(milliseconds: 200),
    );

    scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    shadowAnimation = Tween<double>(begin: 0.08, end: 0.2).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void handleHover(bool isHovered) {
    this.isHovered.value = isHovered;
    if (isHovered) {
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
