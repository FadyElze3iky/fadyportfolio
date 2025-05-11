import 'package:fadyportfolio/features/home/presentation/controllers/home_controller.dart';
import 'package:fadyportfolio/features/home/presentation/widgets/background_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        final homeController = Get.find<HomeController>();
        return SizedBox(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 32,
              horizontal: isSmallScreen ? 16 : 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: theme.colorScheme.onSurface.withOpacity(0.1),
                  thickness: 1,
                ),
                isSmallScreen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(height: 24),
                          _FooterLinks(
                            title: 'Links',
                            links: const [
                              'Home',
                              'About',
                              'Projects',
                              'Tech Stack',
                              'Certificates',
                              'Contact'
                            ],
                            onLinkTap: (link) {
                              // Handle navigation based on link
                              switch (link) {
                                case 'Home':
                                  {
                                    homeController.changeSection('home');
                                  }
                                  break;
                                case 'About':
                                  {
                                    homeController.changeSection('about');
                                  }
                                  break;
                                case 'Projects':
                                  {
                                    homeController.changeSection('projects');
                                  }
                                  break;
                                case 'Tech Stack':
                                  {
                                    homeController.changeSection('tech stack');
                                  }
                                  break;
                                case 'Certificates':
                                  {
                                    homeController
                                        .changeSection('certificates');
                                  }
                                  break;
                                case 'Contact':
                                  {
                                    homeController.changeSection('contact');
                                  }
                                  break;
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                          _FooterLinks(
                            title: 'Elsewhere',
                            links: const [
                              'Email',
                              'LinkedIn',
                              'GitHub',
                            ],
                            onLinkTap: (link) async {
                              // Handle URL launches based on link
                              switch (link) {
                                case 'Email':
                                  final Uri emailLaunchUri = Uri(
                                    scheme: 'mailto',
                                    path: 'fadysaied63@gmail.com',
                                    queryParameters: {
                                      'subject': 'Hello from Portfolio',
                                      'body':
                                          'I would like to connect with you.',
                                    },
                                  );

                                  if (kIsWeb) {
                                    // For web platform
                                    final String emailUrl =
                                        emailLaunchUri.toString();
                                    launchUrl(
                                      Uri.parse(emailUrl),
                                      mode: LaunchMode
                                          .externalNonBrowserApplication,
                                    );
                                  } else if (Platform.isAndroid ||
                                      Platform.isIOS) {
                                    // For mobile platforms
                                    launchUrl(
                                      emailLaunchUri,
                                      mode: LaunchMode.platformDefault,
                                    );
                                  } else {
                                    // For desktop platforms
                                    launchUrl(
                                      emailLaunchUri,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  }
                                  break;
                                case 'LinkedIn':
                                  if (await canLaunchUrl(Uri.parse(
                                      'https://www.linkedin.com/in/fady-saied-334b29218/'))) {
                                    await launchUrl(Uri.parse(
                                        'https://www.linkedin.com/in/fady-saied-334b29218/'));
                                  }
                                  break;
                                case 'GitHub':
                                  if (await canLaunchUrl(Uri.parse(
                                      'https://github.com/FadyElze3iky'))) {
                                    await launchUrl(Uri.parse(
                                        'https://github.com/FadyElze3iky'));
                                  }
                                  break;
                              }
                            },
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                'assets/icons/logo.png',
                                scale: 1,
                                color: theme.hoverColor.withOpacity(.8),
                              ),
                              const SizedBox(width: 12),
                              Text('Thanks for stopping by ッ',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      color: theme.hoverColor.withOpacity(.4))),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ],
                      )
                    : Padding(
                        padding:
                            const EdgeInsets.only(top: 30, right: 40, left: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/icons/logo.png',
                                  scale: 1.5,
                                  color: theme.hoverColor.withOpacity(.7),
                                ),
                                const SizedBox(height: 20),
                                Text('Thanks for stopping by ッ',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                        color:
                                            theme.hoverColor.withOpacity(.5))),
                              ],
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _FooterLinks(
                                  title: 'Elsewhere',
                                  links: const [
                                    'Email',
                                    'LinkedIn',
                                    'GitHub',
                                  ],
                                  onLinkTap: (link) async {
                                    // Handle URL launches based on link
                                    switch (link) {
                                      case 'Email':
                                        final Uri emailLaunchUri = Uri(
                                          scheme: 'mailto',
                                          path: 'fadysaied63@gmail.com',
                                          queryParameters: {
                                            'subject': 'Hello from Portfolio',
                                            'body':
                                                'I would like to connect with you.',
                                          },
                                        );

                                        if (kIsWeb) {
                                          // For web platform
                                          final String emailUrl =
                                              emailLaunchUri.toString();
                                          launchUrl(
                                            Uri.parse(emailUrl),
                                            mode: LaunchMode
                                                .externalNonBrowserApplication,
                                          );
                                        } else if (Platform.isAndroid ||
                                            Platform.isIOS) {
                                          // For mobile platforms
                                          launchUrl(
                                            emailLaunchUri,
                                            mode: LaunchMode.platformDefault,
                                          );
                                        } else {
                                          // For desktop platforms
                                          launchUrl(
                                            emailLaunchUri,
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        }
                                        break;
                                      case 'LinkedIn':
                                        if (await canLaunchUrl(Uri.parse(
                                            'https://www.linkedin.com/in/fady-saied-334b29218/'))) {
                                          await launchUrl(Uri.parse(
                                              'https://www.linkedin.com/in/fady-saied-334b29218/'));
                                        }
                                        break;
                                      case 'GitHub':
                                        if (await canLaunchUrl(Uri.parse(
                                            'https://github.com/FadyElze3iky'))) {
                                          await launchUrl(Uri.parse(
                                              'https://github.com/FadyElze3iky'));
                                        }
                                        break;
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(width: 32),
                            _FooterLinks(
                              title: 'Links',
                              links: const [
                                'Home',
                                'About',
                                'Projects',
                                'Tech Stack',
                                'Certificates',
                                'Contact'
                              ],
                              onLinkTap: (link) {
                                // Handle navigation based on link
                                switch (link) {
                                  case 'Home':
                                    {
                                      homeController.changeSection('home');
                                    }
                                    break;
                                  case 'About':
                                    {
                                      homeController.changeSection('about');
                                    }
                                    break;
                                  case 'Projects':
                                    {
                                      homeController.changeSection('projects');
                                    }
                                    break;
                                  case 'Tech Stack':
                                    {
                                      homeController
                                          .changeSection('tech stack');
                                    }
                                    break;
                                  case 'Certificates':
                                    {
                                      homeController
                                          .changeSection('certificates');
                                    }
                                    break;
                                  case 'Contact':
                                    {
                                      homeController.changeSection('contact');
                                    }
                                    break;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 24),
                Text(
                  '© ${DateTime.now().year} Fady Saied. All Rights Reserved.',
                  style: theme.textTheme.bodySmall?.copyWith(
                      color:
                          theme.textTheme.bodySmall?.color?.withOpacity(0.5)),
                ),
                BlurredBackground()
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FooterLinks extends StatelessWidget {
  final String title;
  final List<String> links;
  final Function(String) onLinkTap;

  const _FooterLinks({
    required this.title,
    required this.links,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.labelLarge!.copyWith(color: theme.hoverColor),
        ),
        const SizedBox(height: 8),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: InkWell(
                onTap: () => onLinkTap(link),
                hoverColor: Colors.transparent,
                child: Text(
                  link,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.hoverColor.withOpacity(0.7),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
