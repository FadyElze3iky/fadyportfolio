import 'package:fadyportfolio/features/about/presentation/bindings/about_binding.dart';
import 'package:fadyportfolio/features/home/presentation/bindings/home_binding.dart';
import 'package:fadyportfolio/features/tech_stack/presentation/bindings/tech_stack_binding.dart';
import 'package:fadyportfolio/features/projects/presentation/bindings/projects_binding.dart';
import 'package:fadyportfolio/features/certificates/presentation/bindings/certificates_binding.dart';
import 'package:fadyportfolio/features/contact/presentation/bindings/contact_binding.dart';
import 'package:get/get.dart';
import '../../features/tech_stack/presentation/screens/tech_stack_screen.dart';
import '../../features/projects/presentation/screens/projects_screen.dart';
import '../../features/certificates/presentation/screens/certificates_screen.dart';
import '../../features/contact/presentation/screens/contact_screen.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/about/presentation/pages/about_view.dart';
import '../../core/layouts/base_layout.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: Routes.TECH_STACK,
      page: () => const TechStackScreen(),
      binding: TechStackBinding(),
    ),
    GetPage(
      name: Routes.PROJECTS,
      page: () => const ProjectsScreen(),
      binding: ProjectsBinding(),
    ),
    GetPage(
      name: Routes.CERTIFICATES,
      page: () => const CertificatesScreen(),
      binding: CertificatesBinding(),
    ),
    GetPage(
      name: Routes.CONTACT,
      page: () => const ContactScreen(),
      binding: ContactBinding(),
    ),
  ];
}
