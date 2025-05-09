import 'package:get/get.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/get_profile.dart';
import '../controllers/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    // Repository
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(),
    );

    // Use cases
    Get.lazyPut<GetProfile>(
      () => GetProfile(Get.find<ProfileRepository>()),
    );

    // Controller
    Get.lazyPut<AboutController>(
      () => AboutController(Get.find<GetProfile>()),
    );
  }
}
