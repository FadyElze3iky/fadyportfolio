import 'package:fadyportfolio/core/utils/functions.dart';
import 'package:fadyportfolio/features/projects/presentation/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/projects_controller.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProjectsController());
    final ProjectsController projectsController =
        Get.find<ProjectsController>();

    final isMobile = MediaQuery.of(context).size.width < 600;

    return Obx(() {
      if (projectsController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (projectsController.error.value.isNotEmpty) {
        return Center(
            child: Text('Error: \\${projectsController.error.value}'));
      }
      return SingleChildScrollView(
        child: Column(
          children: projectsController.projects
              .map((project) => ProjectCard(
                    slogan: project.slogan,
                    cardId: project.appName,
                    onPressed: () {
                      Functions.launchURL(project.github);
                    },
                    title: project.appName,
                    description: project.description,
                    images: project.screens.isNotEmpty ? project.screens : [],
                    icon: project.logo,
                    detailsLabel: 'More Details',
                    isMobile: isMobile,
                  ))
              .toList(),
        ),
      );
    });
  }
}
