import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/screens_animation_controller.dart';

class ScreensAnimation extends StatefulWidget {
  const ScreensAnimation({
    super.key,
    required this.projectId,
    required this.images,
  });

  final String projectId;
  final List<String> images;

  @override
  State<ScreensAnimation> createState() => _ScreensAnimationState();
}

class _ScreensAnimationState extends State<ScreensAnimation> {
  @override
  void initState() {
    super.initState();
    // Initialize controller once
    ScreensAnimationController.init();
    // Set screens after frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScreensAnimationController.instance
          .setProjectScreens(widget.projectId, widget.images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreensAnimationController>(
      builder: (controller) {
        final projectImages = controller.getProjectScreens(widget.projectId);
        if (projectImages.isEmpty) return const SizedBox();

        int columns = controller.columns.value;
        int rows = 3;
        return SizedBox(
          width: double.infinity,
          child: Row(
            children: List.generate(columns, (colIdx) {
              // Determine direction: even columns go down, odd go up
              bool down = colIdx % 2 == 0;
              return Expanded(
                child: AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (context, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(rows, (rowIdx) {
                        int imgIdx =
                            (colIdx * rows + rowIdx) % projectImages.length;
                        double offset =
                            controller.animation.value * 250 * (down ? 1 : -1);
                        return Transform.translate(
                          offset: Offset(0, offset),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Image.network(
                              projectImages[imgIdx],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
