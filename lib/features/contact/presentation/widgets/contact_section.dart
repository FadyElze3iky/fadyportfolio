import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/contact_controller.dart';
import '../../../../core/utils/functions.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final contactController = Get.find<ContactController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: isMobile
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.7,
            child: Text(
              'Contact',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Container(
            width: isMobile
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.all(24),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get in Touch',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                _buildContactItem(
                  context,
                  'Email',
                  'fadysaied63@gmail.com',
                  Icons.email_outlined,
                  () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'fadysaied63@gmail.com',
                      queryParameters: {
                        'subject': 'Hello from Portfolio',
                        'body': 'I would like to connect with you.',
                      },
                    );
                    await launchUrl(emailLaunchUri);
                  },
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  context,
                  'LinkedIn',
                  'Fady Saied',
                  Icons.work_outline,
                  () => Functions.launchURL(
                    'https://www.linkedin.com/in/fady-saied-334b29218',
                  ),
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  context,
                  'GitHub',
                  'FadyElze3iky',
                  Icons.code,
                  () => Functions.launchURL(
                    'https://github.com/FadyElze3iky',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.dividerColor,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: theme.primaryColor,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    value,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
