import 'package:fadyportfolio/core/utils/functions.dart';
import 'package:fadyportfolio/features/contact/presentation/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class ContactFormSection extends StatelessWidget {
  const ContactFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isMobile = MediaQuery.of(context).size.width < 655;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor, width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // MacOS window controls and title
          Row(
            children: [
              // Circles
              ...[
                Colors.red,
                Colors.yellow,
                Colors.green,
              ].map((color) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: color,
                    ),
                  )),
              const Spacer(
                flex: 4,
              ),
              Text(
                "Connect with me on",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(flex: 5),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isMobile
                ? MediaQuery.of(context).size.width * 0.7
                : MediaQuery.of(context).size.width * 0.5,
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 2 : 3,
                childAspectRatio: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 10,
              ),
              children: [
                ContactCard(
                  imgPath: 'assets/images/Discord3d.png',
                  onTap: () {
                    Functions.launchURL(
                        'https://discord.com/users/829831597578387507');
                  },
                  isMobile: isMobile,
                ),
                ContactCard(
                  imgPath: 'assets/images/Facebook3d.png',
                  onTap: () {
                    Functions.launchURL(
                        'https://www.facebook.com/fady.saied.92');
                  },
                  isMobile: isMobile,
                ),
                ContactCard(
                  imgPath: 'assets/images/Instagram3d.png',
                  onTap: () {
                    Functions.launchURL(
                        'https://www.instagram.com/fady_elze3iky/');
                  },
                  isMobile: isMobile,
                ),
                ContactCard(
                  imgPath: 'assets/images/LinkedIn3d.png',
                  onTap: () {
                    Functions.launchURL(
                        'https://www.linkedin.com/in/fady-saied-engineer/');
                  },
                  isMobile: isMobile,
                ),
                ContactCard(
                  imgPath: 'assets/images/Github3d.png',
                  onTap: () {
                    Functions.launchURL('https://github.com/FadyElze3iky');
                  },
                  isMobile: isMobile,
                ),
                ContactCard(
                  imgPath: 'assets/images/Whatapp3d.png',
                  onTap: () {
                    Functions.launchURL(
                        'https://wa.me/201026477255?text=Hello%20there');
                  },
                  isMobile: isMobile,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
