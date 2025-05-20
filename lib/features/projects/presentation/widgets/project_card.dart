import 'dart:ui' as ui;

import 'package:fadyportfolio/core/theme/theme_controller.dart';
import 'package:fadyportfolio/features/projects/presentation/widgets/screens_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/animation.dart';

class ProjectCard extends StatelessWidget {
  final String cardId;
  final String title;
  final String description;
  final List<String> images;
  final String icon;
  final String detailsLabel;
  final Function()? onPressed;
  final bool isMobile;
  final String slogan;
  final bool isvertical;
  final bool isHaveGitHub;
  const ProjectCard({
    super.key,
    required this.cardId,
    required this.title,
    required this.description,
    required this.images,
    required this.icon,
    required this.detailsLabel,
    required this.onPressed,
    required this.isMobile,
    required this.slogan,
    required this.isvertical,
    required this.isHaveGitHub,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final theme = Theme.of(context);

    if (isMobile) {
      // Mobile layout: Column with animation at the bottom
      return Container(
        width: double.infinity,
        height: 500,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
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
        child: Stack(
          children: [
            Positioned(
              top: 350,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ScreensAnimation(
                    isMobile: true,
                    isvertical: isvertical,
                    images: images,
                    projectId: cardId,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    icon,
                    scale: 3.5,
                  ),
                  const SizedBox(height: 16),
                  SelectableText(
                    "$title -- $slogan",
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: theme.cardColor,
                          blurRadius: 24,
                          offset: const Offset(0, 0),
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: SelectableText(
                      description,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (isHaveGitHub)
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onPressed,
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/icons/gethub_dark.png',
                                  scale: 1.2,
                                  color: themeController.isDarkMode
                                      ? Colors.white
                                      : const Color.fromARGB(
                                          255, 139, 139, 139),
                                ),
                                const SizedBox(width: 10),
                                Text(detailsLabel),
                                const SizedBox(width: 4),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (!isHaveGitHub)
                    SelectableText(
                      'Still under development',
                      style: theme.textTheme.bodyMedium,
                    ),

                  // Animation/images at the bottom
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      // Desktop/tablet layout: keep current Stack layout
      return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 600,
        margin: const EdgeInsets.symmetric(vertical: 25),
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
        child: Stack(children: [
          Positioned(
            right: 10,
            child: SizedBox(
              width: 500,
              child: ScreensAnimation(
                isMobile: false,
                isvertical: isvertical,
                images: images,
                projectId: cardId,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  icon,
                  scale: 2,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 400,
                  child: SelectableText(
                    "$title -- $slogan",
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 400,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: theme.cardColor,
                          blurRadius: 24,
                          offset: const Offset(0, 0),
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: SelectableText(
                      description,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Spacer(flex: 1),
                if (isHaveGitHub)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onPressed,
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/icons/gethub_dark.png',
                                scale: 1.2,
                                color: themeController.isDarkMode
                                    ? Colors.white
                                    : const Color.fromARGB(255, 139, 139, 139),
                              ),
                              const SizedBox(width: 10),
                              Text(detailsLabel),
                              const SizedBox(width: 4),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                if (!isHaveGitHub)
                  SelectableText(
                    'Still under development',
                    style: theme.textTheme.bodyMedium,
                  ),
              ],
            ),
          ),
        ]),
      );
    }
  }
}
