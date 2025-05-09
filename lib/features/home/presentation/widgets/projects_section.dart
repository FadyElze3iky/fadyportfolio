import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PROJECTS',
            style: theme.textTheme.headlineMedium?.copyWith(
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            children: const [
              _ProjectCard(
                title: 'X-FIT — Smart Diet Tracking App',
                description:
                    'XFit is a smart diet tracking app that helps users monitor their daily food intake in grams and instantly calculates the nutritional content of each meal. Designed for simplicity and accuracy, XFit empowers users to stay on top of their fitness goals with real-time progress tracking and a clean, intuitive interface.',
                image: 'assets/xfit.png',
                icon: Icons.fitness_center,
                detailsLabel: 'More Details',
              ),
              _ProjectCard(
                title: 'Helping Hands',
                description:
                    'Helping Hands is a Flutter-based mobile app designed to improve emergency response. It features real-time accident alerts, a danger zone map using Keras clustering, an API-powered first aid chatbot built with Keras, contact management, and background services for automatic accident detection—all aimed at providing fast, intelligent help when it matters most.',
                image: 'assets/helping_hands.png',
                icon: Icons.volunteer_activism,
                detailsLabel: 'More Details',
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
  final IconData icon;
  final String detailsLabel;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.image,
    required this.icon,
    required this.detailsLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 400,
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
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(0.1),
                child: Icon(icon, color: theme.primaryColor),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 180,
                child: Text(
                  title,
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 180,
                child: Text(
                  description,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: theme.primaryColor,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(detailsLabel),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_right_alt),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              width: 120,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
