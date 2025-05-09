import 'package:get/get.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/initialize_app.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Repository
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(),
    );

    // Use cases
    Get.lazyPut<InitializeApp>(
      () => InitializeApp(Get.find<HomeRepository>()),
    );

    // Controller
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
