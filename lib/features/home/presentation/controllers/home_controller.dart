import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString _currentSection = 'home'.obs;

  String get currentSection => _currentSection.value;

  void changeSection(String section) {
    _currentSection.value = section;
  }
}
