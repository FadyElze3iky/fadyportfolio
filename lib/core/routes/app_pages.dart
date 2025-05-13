import 'package:fadyportfolio/features/home/presentation/bindings/home_binding.dart';
import 'package:get/get.dart';

import '../../features/home/presentation/pages/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
