import 'package:get/get.dart';

class LayoutController extends GetxController {
  final RxBool isNavbarVisible = true.obs;
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
}
