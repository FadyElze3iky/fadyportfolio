import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../controllers/screens_animation_controller.dart';

class ScreensAnimation extends StatefulWidget {
  const ScreensAnimation({
    super.key,
    required this.projectId,
    required this.images,
    required this.isvertical,
    required this.isMobile,
  });
  final bool isvertical;
  final bool isMobile;
  final String projectId;
  final List<String> images;

  @override
  State<ScreensAnimation> createState() => _ScreensAnimationState();
}

class _ScreensAnimationState extends State<ScreensAnimation> {
  late final ScreensAnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ScreensAnimationController());
    controller.initializeAnimation(widget.projectId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setProjectScreens(widget.projectId, widget.images);
    });
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    controller.handleVisibilityChanged(widget.projectId, info.visibleFraction);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.projectId),
      onVisibilityChanged: _onVisibilityChanged,
      child: GetBuilder<ScreensAnimationController>(
        builder: (controller) {
          final projectImages = controller.getProjectScreens(widget.projectId);
          if (projectImages.isEmpty) return const SizedBox();

          int columns = widget.images.length > 4 ? 3 : 2;
          int rows = 3;
          final animation = controller.getAnimation(widget.projectId);
          if (animation == null) return const SizedBox();
          return SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(columns, (colIdx) {
                bool down = colIdx % 2 == 0;
                return Expanded(
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(rows, (rowIdx) {
                            int imgIdx =
                                (colIdx * rows + rowIdx) % projectImages.length;
                            double offset =
                                animation.value * 50 * (down ? 1 : -1);
                            return Transform.translate(
                              offset: Offset(0, offset),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: !widget.isvertical ? 8 : 0,
                                    vertical: !widget.isvertical ? 6 : 0),
                                child: Image.network(
                                  projectImages[imgIdx],
                                  fit: BoxFit.cover,
                                  scale: !widget.isvertical ? 1.2 : 0.8,
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
