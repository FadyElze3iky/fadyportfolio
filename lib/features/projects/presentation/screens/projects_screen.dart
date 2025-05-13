import 'package:fadyportfolio/features/home/presentation/widgets/projects_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/projects_controller.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ProjectsController>()) {
      Get.put(ProjectsController());
    }
    // final projectsController = Get.find<ProjectsController>();

    return const SingleChildScrollView(
      child: Column(
        children: const [
          ProjectsSection(),
        ],
      ),
    );
  }
}
