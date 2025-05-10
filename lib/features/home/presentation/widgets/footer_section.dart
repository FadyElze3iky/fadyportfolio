import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;

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
                isSmallScreen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.flutter_dash,
                                  color: theme.primaryColor, size: 32),
                              const SizedBox(width: 12),
                              Text('Thanks for stopping by',
                                  style: theme.textTheme.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _FooterLinks(
                            title: 'Links',
                            links: const [
                              'About',
                              'Work',
                              'Tech Stack',
                              'Contact'
                            ],
                          ),
                          const SizedBox(height: 16),
                          _FooterLinks(
                            title: 'Elsewhere',
                            links: const [
                              'Email',
                              'LinkedIn',
                              'GitHub',
                              'Twitter',
                              'Discord'
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.flutter_dash,
                                  color: theme.primaryColor, size: 32),
                              const SizedBox(width: 12),
                              Text('Thanks for stopping by',
                                  style: theme.textTheme.bodyMedium),
                            ],
                          ),
                          const Row(
                            children: [
                              _FooterLinks(
                                title: 'Links',
                                links: [
                                  'About',
                                  'Work',
                                  'Tech Stack',
                                  'Contact'
                                ],
                              ),
                              SizedBox(width: 32),
                              _FooterLinks(
                                title: 'Elsewhere',
                                links: [
                                  'Email',
                                  'LinkedIn',
                                  'GitHub',
                                  'Twitter',
                                  'Discord'
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                const SizedBox(height: 24),
                Text(
                  '© ${DateTime.now().year} Fady Saied. All Rights Reserved.',
                  style: theme.textTheme.bodySmall?.copyWith(
                      color:
                          theme.textTheme.bodySmall?.color?.withOpacity(0.5)),
                ),
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
  const _FooterLinks({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(link, style: theme.textTheme.bodyMedium),
            )),
      ],
    );
  }
}
