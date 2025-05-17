import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreensAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  // Singleton instance
  static ScreensAnimationController get instance =>
      Get.find<ScreensAnimationController>();
  static bool _initialized = false;

  static void init() {
    if (!_initialized) {
      Get.put(ScreensAnimationController());
      _initialized = true;
    }
  }

  final Map<String, AnimationController> animationControllers = {};
  final Map<String, Animation<double>> animations = {};
  final Map<String, double> visibleFractions = {};
  final RxString currentAnimatedCardId = ''.obs;

  // Map to store screens for each project by project ID or index
  final RxMap<String, List<String>> projectScreens =
      <String, List<String>>{}.obs;
  final RxInt columns = 3.obs;

  @override
  void onInit() {
    super.onInit();
    initializeAnimation("default");
  }

  void initializeAnimation(String cardId) {
    if (!animationControllers.containsKey(cardId)) {
      animationControllers[cardId] = AnimationController(
        duration: const Duration(seconds: 6),
        vsync: this,
      );
      animations[cardId] = Tween<double>(begin: -1, end: 1).animate(
        CurvedAnimation(
          parent: animationControllers[cardId]!,
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  void startAnimation(String cardId) {
    animationControllers[cardId]?.repeat(reverse: true);
    currentAnimatedCardId.value = cardId;
  }

  void stopAnimation(String cardId) {
    animationControllers[cardId]?.stop();
  }

  void stopAllExcept(String cardId) {
    animationControllers.forEach((id, controller) {
      if (id != cardId) controller.stop();
    });
  }

  Animation<double>? getAnimation(String cardId) => animations[cardId];

  void setProjectScreens(String projectId, List<String> screens) {
    projectScreens[projectId] = screens;
    columns.value = screens.length >= 4 ? 3 : 2;
    update(); // Notify listeners of the change
  }

  List<String> getProjectScreens(String projectId) {
    return projectScreens[projectId] ?? [];
  }

  void handleVisibilityChanged(String cardId, double visibleFraction) {
    visibleFractions[cardId] = visibleFraction;
    // Find the card with the highest visible fraction
    String? mostVisibleCardId;
    double maxFraction = 0;
    visibleFractions.forEach((id, fraction) {
      if (fraction > maxFraction) {
        maxFraction = fraction;
        mostVisibleCardId = id;
      }
    });
    if (mostVisibleCardId != null) {
      startAnimation(mostVisibleCardId!);
      stopAllExcept(mostVisibleCardId!);
    }
  }

  @override
  void onClose() {
    for (var controller in animationControllers.values) {
      controller.dispose();
    }
    super.onClose();
  }
}
