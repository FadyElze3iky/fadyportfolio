import 'package:fadyportfolio/core/utils/functions.dart';
import 'package:fadyportfolio/features/projects/presentation/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/projects_controller.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProjectsController());
    final ProjectsController projectsController =
        Get.find<ProjectsController>();

    final isMobile = MediaQuery.of(context).size.width < 655;
    final theme = Theme.of(context);

    return Obx(() {
      if (projectsController.isLoading.value) {
        return Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: isMobile
                  ? MediaQuery.of(context).size.width * 0.9
                  : MediaQuery.of(context).size.width * 0.7,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Projects',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Projects and ideas I’ve worked on',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Divider(
                color: theme.dividerColor,
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
              baseColor: theme.cardColor,
              highlightColor: theme.cardColor.withOpacity(.2),
              child: Container(
                width: isMobile
                    ? double.infinity
                    : MediaQuery.of(context).size.width * 0.7,
                height: isMobile ? 470 : 600,
                margin: isMobile
                    ? const EdgeInsets.symmetric(vertical: 20, horizontal: 12)
                    : const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: theme.dividerColor, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: theme.cardColor.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Projects',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Projects and ideas I’ve worked on',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Divider(
                color: theme.dividerColor,
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: projectsController.projects
                  .map((project) => ProjectCard(
                        isvertical: project.vertical,
                        slogan: project.slogan,
                        cardId: project.appName,
                        isHaveGitHub: project.github.isNotEmpty,
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
