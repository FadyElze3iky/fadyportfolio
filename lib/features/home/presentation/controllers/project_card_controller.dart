import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProjectCardController extends GetxController
    with GetTickerProviderStateMixin {
  final Map<String, AnimationController> animationControllers = {};
  final Map<String, Animation<double>> animations = {};

  void initializeAnimation(String cardId) {
    if (!animationControllers.containsKey(cardId)) {
      animationControllers[cardId] = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      );

      animations[cardId] = Tween<double>(begin: 0, end: 30).animate(
        CurvedAnimation(
          parent: animationControllers[cardId]!,
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  void startAnimation(String cardId) {
    animationControllers[cardId]?.repeat(reverse: true);
  }

  void stopAnimation(String cardId) {
    animationControllers[cardId]?.stop();
  }

  @override
  void onClose() {
    for (var controller in animationControllers.values) {
      controller.dispose();
    }
    super.onClose();
  }
}
