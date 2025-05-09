import 'package:get/get.dart';
import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_profile.dart';

class AboutController extends GetxController {
  final GetProfile _getProfile;
  final Rx<Profile?> profile = Rx<Profile?>(null);
  final RxBool isLoading = false.obs;

  AboutController(this._getProfile);

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    isLoading.value = true;
    try {
      final result = await _getProfile();
      profile.value = result;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load profile',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
