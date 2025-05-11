import 'package:fadyportfolio/features/home/presentation/widgets/background_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/home/presentation/widgets/navbar.dart';
import 'layout_controller.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;

  const BaseLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LayoutController());
    final scrollController = ScrollController();

    scrollController.addListener(() {
      controller.onScroll(scrollController.position.pixels);
    });

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              BlurredBackground(),
              // Main content with scroll controller
              SingleChildScrollView(
                controller: scrollController,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: child,
                ),
              ),

              // Animated navbar
              Obx(() => AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    top: controller.isNavbarVisible.value ? 0 : -100,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: constraints.maxWidth > 1200
                            ? constraints.maxWidth * 0.6
                            : constraints.maxWidth * 0.9,
                        padding: const EdgeInsets.only(top: 20),
                        child: const Navbar(),
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
