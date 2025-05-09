import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/layouts/base_layout.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_header.dart';
import '../widgets/projects_section.dart';
import '../widgets/get_to_know_me_section.dart';
import '../widgets/lets_work_together_section.dart';
import '../widgets/footer_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100), // Space for navbar
              if (controller.currentSection == 'home') ...[
                const HomeHeader(),
                const ProjectsSection(),
                const GetToKnowMeSection(),
                const LetsWorkTogetherSection(),
              ] else if (controller.currentSection == 'about') ...[
                const GetToKnowMeSection(),
              ] else if (controller.currentSection == 'projects') ...[
                const ProjectsSection(),
              ] else if (controller.currentSection == 'tech-stack') ...[
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tech Stack',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 24),
                        // Add your tech stack content here
                      ],
                    ),
                  ),
                ),
              ] else if (controller.currentSection == 'contact') ...[
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 24),
                        // Add your contact content here
                      ],
                    ),
                  ),
                ),
              ],
              const FooterSection(),
            ],
          ),
        );
      }),
    );
  }
}
