import 'package:fadyportfolio/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectCard extends StatelessWidget {
  final String cardId;
  final String title;
  final String description;
  final String image;
  final String icon;
  final String detailsLabel;
  final Function()? onPressed;
  final bool isMobile;

  const ProjectCard({
    super.key,
    required this.cardId,
    required this.title,
    required this.description,
    required this.image,
    required this.icon,
    required this.detailsLabel,
    required this.onPressed,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    print(image);
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
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.0 : 40.0,
            vertical: isMobile ? 24 : 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(icon, scale: isMobile ? 6 : 4),
              const SizedBox(height: 16),
              SizedBox(
                width: isMobile ? double.infinity : 400,
                child: Text(
                  title,
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
