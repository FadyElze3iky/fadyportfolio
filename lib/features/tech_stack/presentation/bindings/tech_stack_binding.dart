import 'package:get/get.dart';
import '../controllers/tech_stack_controller.dart';

class TechStackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TechStackController>(() => TechStackController());
  }
}
