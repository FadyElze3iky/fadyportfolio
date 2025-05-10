import 'package:flutter/material.dart';

class LetsWorkTogetherSection extends StatelessWidget {
  const LetsWorkTogetherSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextContent(context, theme, isMobile),
                const SizedBox(height: 24),
                _buildButton(theme),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextContent(context, theme, isMobile),
                const SizedBox(width: 32),
                _buildButton(theme),
              ],
            ),
    );
  }

  Widget _buildTextContent(
      BuildContext context, ThemeData theme, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isMobile
              ? MediaQuery.of(context).size.width * 0.9
              : MediaQuery.of(context).size.width * 0.7,
          child: Text(
            "Let's work together",
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: isMobile
              ? MediaQuery.of(context).size.width * 0.9
              : MediaQuery.of(context).size.width * 0.7,
          child: Text(
            "Want to discuss an opportunity to create something great?\nI'm ready when you are.",
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF181818),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Inner glow simulation
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 101, 101, 101)
                          .withOpacity(0.18),
                      blurRadius: 24,
                      spreadRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {},
              hoverColor: const Color(0xFF101010),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/icons/arrow_icon.png',
                        scale: 4, color: Colors.white),
                    const SizedBox(width: 12),
                    const Text(
                      'Get in touch',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
