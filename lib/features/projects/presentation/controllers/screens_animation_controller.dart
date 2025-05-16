import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreensAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
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

  late final AnimationController animationController;
  late final Animation<double> animation;

  // Map to store screens for each project by project ID or index
  final RxMap<String, List<String>> projectScreens =
      <String, List<String>>{}.obs;
  final RxInt columns = 2.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
    animation = Tween<double>(begin: -1, end: 1).animate(animationController);
  }

  void setProjectScreens(String projectId, List<String> screens) {
    projectScreens[projectId] = screens;
    columns.value = screens.length > 5 ? 3 : 2;
    update(); // Notify listeners of the change
  }

  List<String> getProjectScreens(String projectId) {
    return projectScreens[projectId] ?? [];
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
