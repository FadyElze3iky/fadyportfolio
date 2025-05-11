import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/layouts/base_layout.dart';
import '../controllers/about_controller.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/get_profile.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ProfileRepository>()) {
      Get.put<ProfileRepository>(ProfileRepositoryImpl());
    }
    if (!Get.isRegistered<GetProfile>()) {
      Get.put<GetProfile>(GetProfile(Get.find<ProfileRepository>()));
    }
    if (!Get.isRegistered<AboutController>()) {
      Get.put<AboutController>(AboutController(Get.find<GetProfile>()));
    }
    return Obx(() {
      final controller = Get.find<AboutController>();
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final profile = controller.profile.value;
      if (profile == null) {
        return const Center(child: Text('No profile data available'));
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100), // Add space for navbar
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            const Text(
              'About Me',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              profile.bio,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Skills',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...profile.skills.map((skill) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(skill),
                    ],
                  ),
                )),
          ],
        ),
      );
    });
  }
}
