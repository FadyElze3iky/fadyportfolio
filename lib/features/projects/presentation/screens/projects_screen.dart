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
    final theme = Theme.of(context);

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
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: isMobile
                  ? MediaQuery.of(context).size.width * 0.9
                  : MediaQuery.of(context).size.width * 0.7,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'PROJECTS',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            Column(
              children: projectsController.projects
                  .map((project) => ProjectCard(
                        isvertical: project.vertical,
                        slogan: project.slogan,
                        cardId: project.appName,
                        onPressed: () {
                          Functions.launchURL(project.github);
                        },
                        title: project.appName,
                        description: project.description,
                        images:
                            project.screens.isNotEmpty ? project.screens : [],
                        icon: project.logo,
                        detailsLabel: 'More Details',
                        isMobile: isMobile,
                      ))
                  .toList(),
            ),
          ],
        ),
      );
    });
  }
}
