import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                Row(
                  children: [
                    _FooterLinks(
                      title: 'Links',
                      links: const ['About', 'Work', 'Tech Stack', 'Contact'],
                    ),
                    const SizedBox(width: 32),
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
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '© 2023 Fady Saied. All Rights Reserved.',
              style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.5)),
            ),
          ],
        ),
      ),
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
