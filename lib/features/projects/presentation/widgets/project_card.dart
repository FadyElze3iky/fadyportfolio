import 'package:fadyportfolio/core/theme/theme_controller.dart';
import 'package:fadyportfolio/features/home/presentation/controllers/project_card_controller.dart';
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
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final theme = Theme.of(context);

    return Container(
      width:
          isMobile ? double.infinity : MediaQuery.of(context).size.width * 0.7,
      height: isMobile ? 470 : 600,
      margin: isMobile ? const EdgeInsets.symmetric(horizontal: 16) : null,
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
          right: 0,
          child: SizedBox(
            width: 600,
            child: ScreensAnimation(
              images: images,
              projectId: cardId,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.0 : 40.0,
            vertical: isMobile ? 24 : 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                icon,
                scale: isMobile ? 4 : 2,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: isMobile ? double.infinity : 400,
                child: Text(
                  "$title -- $slogan",
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: isMobile ? double.infinity : 400,
                child: isMobile
                    ? Text(
                        description,
                        style: theme.textTheme.bodyMedium,
                      )
                    : Container(
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
                        child: Text(
                          description,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              const Spacer(flex: 1),
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
            ],
          ),
        ),
      ]),
    );
  }
}
