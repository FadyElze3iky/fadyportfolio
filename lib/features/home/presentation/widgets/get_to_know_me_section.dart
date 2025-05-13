import 'dart:ui';

import 'package:fadyportfolio/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/get_to_know_me_controller.dart';
import 'background_painter.dart';
import '../controllers/info_card_controller.dart';

class GetToKnowMeSection extends StatelessWidget {
  const GetToKnowMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetToKnowMeController());
    final homeController = Get.find<HomeController>();

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
                clipBehavior: Clip.antiAliasWithSaveLayer,
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
                    onTap: () {
                      homeController.changeSection('about');
                    },
                  ),
                  _InfoCard(
                    title: 'Tech Stack',
                    description: 'The dev tools, apps and devices I use.',
                    image: 'assets/images/apps.png',
                    isStack: true,
                    isMobile: isMobile,
                    onTap: () {
                      homeController.changeSection('tech stack');
                    },
                  ),
                  _InfoCard(
                    title: 'Certificates',
                    description: 'Certificates I have',
                    image: 'assets/images/certificate.png',
                    isMobile: isMobile,
                    onTap: () {
                      homeController.changeSection('certificates');
                    },
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
                      clipBehavior: Clip.antiAliasWithSaveLayer,
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
                      onTap: () {
                        homeController.changeSection('about');
                      },
                    ),
                    const SizedBox(width: 24),
                    _InfoCard(
                      title: 'Tech Stack',
                      description: 'The dev tools, apps and devices I use.',
                      image: 'assets/images/apps.png',
                      isStack: true,
                      isMobile: isMobile,
                      onTap: () {
                        homeController.changeSection('tech stack');
                      },
                    ),
                    const SizedBox(width: 24),
                    _InfoCard(
                      title: 'Certificates',
                      description: 'Certificates I have',
                      image: 'assets/images/certificate.png',
                      isMobile: isMobile,
                      onTap: () {
                        homeController.changeSection('certificates');
                      },
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
  final VoidCallback? onTap;

  const _InfoCard({
    required this.title,
    required this.description,
    required this.image,
    this.isStack = false,
    this.isMobile = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.put(
      InfoCardController(),
      tag: title,
    );
    return MouseRegion(
      onEnter: (_) => controller.handleHover(true),
      onExit: (_) => controller.handleHover(false),
      child: GestureDetector(
        onTap: () {
          onTap?.call();
          controller.handleHover(false);
        },
        child: AnimatedBuilder(
          animation: controller.animationController,
          builder: (context, child) {
            final isHovered = controller.isHovered.value;
            return Transform.scale(
              scale: controller.scaleAnimation.value,
              child: Container(
                width:
                    isMobile ? MediaQuery.of(context).size.width * 0.85 : 350,
                height: 300,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: theme.dividerColor,
                    width: isHovered ? 2 : 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: theme.cardColor.withOpacity(
                        controller.shadowAnimation.value,
                      ),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    if (isHovered)
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: BlurredBackground(),
                        ),
                      ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
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
                            const Spacer(flex: 1),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
