import 'package:fadypotfolio/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: isMobile
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.7,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'PROJECTS',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              _ProjectCard(
                onPressed: () {},
                title: 'X-FIT — Smart Diet Tracking App',
                description:
                    'XFit is a smart diet tracking app that helps users monitor their daily food intake in grams and instantly calculates the nutritional content of each meal. Designed for simplicity and accuracy, XFit empowers users to stay on top of their fitness goals with real-time progress tracking and a clean, intuitive interface.',
                image: 'assets/images/xfit_screen0.png',
                icon: 'assets/images/xfit_logo.png',
                detailsLabel: 'More Details',
                isMobile: isMobile,
              ),
              const SizedBox(height: 32),
              _ProjectCard(
                onPressed: () {},
                title: 'X-FIT — Smart Diet Tracking App',
                description:
                    'XFit is a smart diet tracking app that helps users monitor their daily food intake in grams and instantly calculates the nutritional content of each meal. Designed for simplicity and accuracy, XFit empowers users to stay on top of their fitness goals with real-time progress tracking and a clean, intuitive interface.',
                image: 'assets/images/xfit_screen0.png',
                icon: 'assets/images/xfit_logo.png',
                detailsLabel: 'More Details',
                isMobile: isMobile,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: isMobile
                      ? MediaQuery.of(context).size.width * 0.9
                      : MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text('See all projects'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String icon;
  final String detailsLabel;
  final Function()? onPressed;
  final bool isMobile;
  const _ProjectCard({
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
        if (!isMobile)
          Positioned(
            top: 30,
            right: 30,
            child: Image.asset(
              image,
              scale: 4,
              fit: BoxFit.none,
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
              Image.asset(
                icon,
                scale: isMobile ? 6 : 4,
              ),
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
                child: GestureDetector(
                  onTap: onPressed,
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
            ],
          ),
        ),
      ]),
    );
  }
}
