import 'package:fadypotfolio/core/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fadypotfolio/core/theme/theme_controller.dart';
import '../controllers/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    super.key,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showOverlay(BuildContext context) {
    _removeOverlay();

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMenuItem(context, 'Home', 'home'),
                  _buildMenuItem(context, 'About', 'about'),
                  _buildMenuItem(context, 'Projects', 'projects'),
                  _buildMenuItem(context, 'Tech Stack', 'tech stack'),
                  _buildMenuItem(context, 'Contact', 'contact'),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _buildMenuItem(BuildContext context, String label, String section) {
    final theme = Theme.of(context);
    final controller = Get.find<HomeController>();

    return Obx(() {
      final isActive = controller.currentSection == section;
      return InkWell(
        onTap: () {
          controller.changeSection(section);
          _removeOverlay();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? theme.primaryColor.withOpacity(0.1) : null,
          ),
          child: Row(
            children: [
              Text(
                label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isActive
                      ? theme.primaryColor
                      : theme.textTheme.bodyLarge?.color,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              if (isActive) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: theme.primaryColor,
                ),
              ],
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final homeController = Get.find<HomeController>();
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width > 1200 ? 16 : 8,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => homeController.changeSection('home'),
                    child: Image.asset(
                      'assets/icons/logo.png',
                      scale: 2,
                      color: themeController.isDarkMode
                          ? Colors.white
                          : const Color.fromARGB(255, 139, 139, 139),
                    ),
                  ),
                ),
                SizedBox(width: size.width > 1200 ? 24 : 12),
                if (size.width > 600) ...[
                  _NavButton(
                    label: 'About',
                    onPressed: () => homeController.changeSection('about'),
                  ),
                  _NavButton(
                    label: 'Projects',
                    onPressed: () => homeController.changeSection('projects'),
                  ),
                  _NavButton(
                    label: 'Tech Stack',
                    onPressed: () => homeController.changeSection('tech stack'),
                  ),
                  _NavButton(
                    label: 'Contact',
                    onPressed: () => homeController.changeSection('contact'),
                  ),
                ] else
                  CompositedTransformTarget(
                    link: _layerLink,
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        if (_overlayEntry == null) {
                          _showOverlay(context);
                        } else {
                          _removeOverlay();
                        }
                      },
                    ),
                  ),
              ],
            );
          }),
          Obx(() {
            return Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/icons/linkedin_dark.png',
                    scale: 1.2,
                    color: themeController.isDarkMode
                        ? Colors.white
                        : const Color.fromARGB(255, 139, 139, 139),
                  ),
                  onPressed: () => Functions.launchURL(
                      'https://www.linkedin.com/in/fady-saied-334b29218'),
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/icons/gethub_dark.png',
                    scale: 1.2,
                    color: themeController.isDarkMode
                        ? Colors.white
                        : const Color.fromARGB(255, 139, 139, 139),
                  ),
                  onPressed: () =>
                      Functions.launchURL('https://github.com/FadyElze3iky'),
                ),
                Container(
                  height: 20,
                  width: .5,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/icons/sun_dark.png',
                    scale: 1.2,
                    color: themeController.isDarkMode
                        ? Colors.white
                        : const Color.fromARGB(255, 139, 139, 139),
                  ),
                  onPressed: () => themeController.toggleTheme(),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _NavButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.find<HomeController>();
    final size = MediaQuery.of(context).size;

    return Obx(() {
      final isActive = controller.currentSection == label.toLowerCase();
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width > 1200 ? 16 : 8,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isActive
                    ? theme.hoverColor
                    : theme.textTheme.headlineSmall?.color,
                fontSize: isActive ? 16 : 14,
              ),
            ),
          ),
        ),
      );
    });
  }
}
