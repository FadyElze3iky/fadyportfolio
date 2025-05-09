import 'package:fadypotfolio/core/theme/theme_controller.dart';
import 'package:fadypotfolio/core/utils/functions.dart';
import 'package:fadypotfolio/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1200;
    final isLargeScreen = screenWidth >= 1200;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen
                ? 16.0
                : isMediumScreen
                    ? 24.0
                    : 32.0,
            vertical: isSmallScreen ? 24.0 : 32.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isLargeScreen) ...[
                // Large screen layout (>= 1200px)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildContent(context, isSmallScreen, isMediumScreen),
                    const SizedBox(width: 48),
                    _buildProfileImage(
                        themeController, isSmallScreen, isMediumScreen),
                  ],
                ),
              ] else if (isMediumScreen) ...[
                // Medium screen layout (600px - 1199px)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 20,
                      child:
                          _buildContent(context, isSmallScreen, isMediumScreen),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      flex: 16,
                      child: _buildProfileImage(
                          themeController, isSmallScreen, isMediumScreen),
                    ),
                  ],
                ),
              ] else ...[
                // Small screen layout (< 600px)

                _buildContent(context, isSmallScreen, isMediumScreen),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(
      BuildContext context, bool isSmallScreen, bool isMediumScreen) {
    final homeController = Get.find<HomeController>();
    final fontSize = isSmallScreen
        ? 16.0
        : isMediumScreen
            ? 18.0
            : 20.0;
    final headlineSize = isSmallScreen
        ? 60.0
        : isMediumScreen
            ? 50.0
            : 80.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isSmallScreen) ...[
          Row(children: [
            Text(
              "Hi",
              style: theme.textTheme.headlineLarge!
                  .copyWith(fontSize: headlineSize),
            ),
            Image.asset('assets/icons/fady_hi.png')
          ]),
          SizedBox(
            height: 20,
          ),
        ],
        Row(
          children: [
            Text(
              "I'm",
              style: theme.textTheme.headlineLarge!.copyWith(
                color: theme.textTheme.headlineLarge!.color!.withOpacity(.4),
                fontSize: headlineSize,
              ),
            ),
            if (!isSmallScreen && !isMediumScreen) ...[
              Text(
                " Fady Saied",
                style: theme.textTheme.headlineLarge!.copyWith(
                  fontSize: headlineSize,
                ),
              ),
            ] else ...[
              Flexible(
                child: Text(
                  " Fady Saied",
                  style: theme.textTheme.headlineLarge!.copyWith(
                    fontSize: headlineSize,
                  ),
                ),
              ),
            ]
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'A software engineer skilled in building cross-platform\napplications with Flutter and Jetpack Compose. I also integrate\nmachine learning to develop intelligent, user-centric solutions.',
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: fontSize,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () {
                Functions.launchURL(
                    'https://drive.google.com/file/d/1oca25a8-xk91EW3ZtYBHzTI5seKm87z0/view');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen
                      ? 16
                      : isMediumScreen
                          ? 20
                          : 24,
                  vertical: isSmallScreen ? 12 : 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('See my resume'),
            ),
            OutlinedButton(
              onPressed: () => homeController.changeSection('contact'),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.textTheme.bodyLarge?.color,
                side: BorderSide(color: theme.dividerColor),
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen
                      ? 16
                      : isMediumScreen
                          ? 20
                          : 24,
                  vertical: isSmallScreen ? 12 : 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Get in touch'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage(ThemeController themeController, bool isSmallScreen,
      bool isMediumScreen) {
    final scale = isSmallScreen
        ? 2.0
        : isMediumScreen
            ? 1.6
            : 1.4;

    return Image.asset(
      themeController.isDarkMode
          ? 'assets/images/profile_dark.png'
          : 'assets/images/profile_light.png',
      scale: scale,
      fit: BoxFit.cover,
    );
  }
}
