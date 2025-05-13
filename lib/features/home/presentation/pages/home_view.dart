import 'package:fadyportfolio/features/about/presentation/pages/about_view.dart';
import 'package:fadyportfolio/features/certificates/presentation/screens/certificates_screen.dart';
import 'package:fadyportfolio/features/contact/presentation/screens/contact_screen.dart';
import 'package:fadyportfolio/features/projects/presentation/screens/projects_screen.dart';
import 'package:fadyportfolio/features/tech_stack/presentation/screens/tech_stack_screen.dart';
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100), // Space for navbar
            if (controller.currentSection == 'home') ...[
              const HomeHeader(),
              const ProjectsSection(),
              const GetToKnowMeSection(),
              const LetsWorkTogetherSection(),
            ] else if (controller.currentSection == 'about') ...[
              const AboutView(),
            ] else if (controller.currentSection == 'projects') ...[
              const ProjectsScreen(),
            ] else if (controller.currentSection == 'tech stack') ...[
              const TechStackScreen(),
            ] else if (controller.currentSection == 'certificates') ...[
              const CertificatesScreen()
            ] else if (controller.currentSection == 'contact') ...[
              const ContactScreen(),
            ],
            const FooterSection(),
          ],
        );
      }),
    );
  }
}
