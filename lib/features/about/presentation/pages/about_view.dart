import 'package:fadyportfolio/core/theme/theme_controller.dart';
import 'package:fadyportfolio/core/utils/functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/about_controller.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/get_profile.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1200;
    final isLargeScreen = screenWidth >= 1200;

    // Calculate responsive padding
    final horizontalPadding = isSmallScreen
        ? screenWidth * 0.05
        : isMediumScreen
            ? screenWidth * 0.1
            : screenWidth * 0.15;

    final theme = Theme.of(context);
    if (!Get.isRegistered<ProfileRepository>()) {
      Get.put<ProfileRepository>(ProfileRepositoryImpl());
    }
    if (!Get.isRegistered<GetProfile>()) {
      Get.put<GetProfile>(GetProfile(Get.find<ProfileRepository>()));
    }
    if (!Get.isRegistered<AboutController>()) {
      Get.put<AboutController>(AboutController(Get.find<GetProfile>()));
    }
    return Obx(() {
      final controller = Get.find<AboutController>();
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final profile = controller.profile.value;
      if (profile == null) {
        return const Center(child: SelectableText('No profile data available'));
      }

      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: isSmallScreen ? 50 : 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  'A little bit about me',
                  style: theme.textTheme.headlineLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SelectableText(
                  'Who I am and what I do.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: theme.colorScheme.onSurface.withOpacity(0.1),
              thickness: 1,
            ),
            Row(
              children: [
                if (isLargeScreen) ...[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                'WHO I AM',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.textTheme.bodyMedium!.color!
                                        .withOpacity(.6)),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const SelectableText("I'm "),
                                  SelectableText(
                                    "Fady",
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(color: theme.hoverColor),
                                  ),
                                  const SelectableText(
                                      " a Software Engineer, "),
                                  SelectableText("Egypt 🇪🇬.",
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(color: theme.hoverColor)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SelectableText(
                                'WHAT I DO',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.textTheme.bodyMedium!.color!
                                        .withOpacity(.6)),
                              ),
                              const SizedBox(height: 5),
                              SelectableText(
                                profile.whatIDo1,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 48),
                        Expanded(
                          flex: 1,
                          child: _buildProfileImage(
                              themeController, isSmallScreen, isMediumScreen),
                        ),
                      ],
                    ),
                  ),
                ] else if (isMediumScreen) ...[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                'WHO I AM',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.textTheme.bodyMedium!.color!
                                        .withOpacity(.6)),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const SelectableText("I'm "),
                                  SelectableText(
                                    "Fady",
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(color: theme.hoverColor),
                                  ),
                                  const SelectableText(
                                      " a Software Engineer, "),
                                  SelectableText("Egypt 🇪🇬.",
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(color: theme.hoverColor)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SelectableText(
                                'WHAT I DO',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.textTheme.bodyMedium!.color!
                                        .withOpacity(.6)),
                              ),
                              const SizedBox(height: 5),
                              SelectableText(
                                profile.whatIDo1,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 1,
                          child: _buildProfileImage(
                              themeController, isSmallScreen, isMediumScreen),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  // Small screen layout
                  Expanded(
                    child: Column(
                      children: [
                        _buildProfileImage(
                            themeController, isSmallScreen, isMediumScreen),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              'WHO I AM',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  color: theme.textTheme.bodyMedium!.color!
                                      .withOpacity(.6)),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const SelectableText("I'm "),
                                SelectableText(
                                  "Fady",
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(color: theme.hoverColor),
                                ),
                                const SelectableText(" a Software Engineer, "),
                                SelectableText("Egypt 🇪🇬.",
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(color: theme.hoverColor)),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SelectableText(
                              'WHAT I DO',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  color: theme.textTheme.bodyMedium!.color!
                                      .withOpacity(.6)),
                            ),
                            const SizedBox(height: 5),
                            SelectableText(
                              profile.whatIDo1,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 20),
            SelectableText(
              profile.whatIDo2,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  'WHAT I DID',
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color:
                          theme.textTheme.bodyMedium!.color!.withOpacity(.6)),
                ),
                const SizedBox(height: 5),
                SelectableText(profile.WhatIDid)
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: isSmallScreen ? screenWidth : 500,
              child: Text.rich(
                TextSpan(
                  style: theme.textTheme.bodyMedium,
                  children: [
                    const TextSpan(text: 'Feel free to reach out via '),
                    TextSpan(
                        text: 'e-mail',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: theme.hoverColor),
                        mouseCursor: SystemMouseCursors.click,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Functions.launchURL(
                              'mailto:fadysaied63@gmail.com')),
                    const TextSpan(text: ', or follow me on '),
                    TextSpan(
                      text: 'Instagram',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: theme.hoverColor),
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrl(Uri.parse(
                            'https://www.instagram.com/fady_elze3iky?igsh=YXlqMGo4bW9jcmZ1&utm_source=qr')),
                    ),
                    const TextSpan(
                        text:
                            '. Want to see where I\'ve worked? Check out my '),
                    TextSpan(
                      text: 'Resume',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: theme.hoverColor),
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrl(Uri.parse(
                            'https://drive.google.com/file/d/1oca25a8-xk91EW3ZtYBHzTI5seKm87z0/view')),
                    ),
                    const TextSpan(text: ', or Connect with me on '),
                    TextSpan(
                      text: 'LinkedIn',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: theme.hoverColor),
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrl(Uri.parse(
                            'https://www.linkedin.com/in/fady-saied-engineer/')),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SelectableText("Let's build something great..."),
            const SizedBox(height: 30),
          ],
        ),
      );
    });
  }

  Widget _buildProfileImage(ThemeController themeController, bool isSmallScreen,
      bool isMediumScreen) {
    final scale = isSmallScreen ? 2.0 : 1.0;

    return Image.asset(
      themeController.isDarkMode
          ? 'assets/images/profile_dark.png'
          : 'assets/images/profile_light.png',
      scale: scale,
      fit: BoxFit.cover,
    );
  }
}
