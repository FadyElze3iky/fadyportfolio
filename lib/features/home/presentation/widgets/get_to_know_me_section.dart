import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/get_to_know_me_controller.dart';

class GetToKnowMeSection extends StatelessWidget {
  const GetToKnowMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetToKnowMeController());

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
                'Get to know me',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
          const SizedBox(height: 32),
          if (isMobile) ...[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.onPageChanged(index);
                },
                scrollBehavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                children: [
                  _InfoCard(
                    title: 'About me',
                    description: 'Who I am and what I do.',
                    image: 'assets/images/fady_love.png',
                    isMobile: isMobile,
                  ),
                  _InfoCard(
                    title: 'Tech Stack',
                    description: 'The dev tools, apps and devices I use.',
                    image: 'assets/images/apps.png',
                    isStack: true,
                    isMobile: isMobile,
                  ),
                  _InfoCard(
                    title: 'Certificates',
                    description: 'Certificates I have',
                    image: 'assets/images/certificate.png',
                    isMobile: isMobile,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentPage.value == index
                            ? theme.primaryColor
                            : theme.dividerColor,
                      ),
                    ),
                  ),
                )),
          ] else
            ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _InfoCard(
                      title: 'About me',
                      description: 'Who I am and what I do.',
                      image: 'assets/images/fady_love.png',
                      isMobile: isMobile,
                    ),
                    const SizedBox(width: 24),
                    _InfoCard(
                      title: 'Tech Stack',
                      description: 'The dev tools, apps and devices I use.',
                      image: 'assets/images/apps.png',
                      isStack: true,
                      isMobile: isMobile,
                    ),
                    const SizedBox(width: 24),
                    _InfoCard(
                      title: 'Certificates',
                      description: 'Certificates I have',
                      image: 'assets/images/certificate.png',
                      isMobile: isMobile,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isStack;
  final bool isMobile;
  const _InfoCard({
    required this.title,
    required this.description,
    required this.image,
    this.isStack = false,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: isMobile ? MediaQuery.of(context).size.width * 0.85 : 350,
      height: 300,
      padding: const EdgeInsets.only(
        top: 24,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Text(
                  title,
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                if (!isStack) ...[
                  const Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Image.asset(
                      image,
                      scale: 2.5,
                      fit: BoxFit.none,
                    ),
                  ),
                ]
              ],
            ),
          ),
          if (isStack)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                image,
                scale: 4.5,
                fit: BoxFit.none,
              ),
            ),
        ],
      ),
    );
  }
}
