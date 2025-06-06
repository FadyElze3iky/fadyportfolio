import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/theme_controller.dart';
import '../utils/functions.dart';
import 'home_controller.dart';

class Navbar extends StatefulWidget {
  final ScrollController? scrollController;

  const Navbar({
    super.key,
    this.scrollController,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  late AnimationController _animationController;
  late Animation<double> _animation;
  late ScrollController _scrollController;
  bool _isScrollingUp = false;
  double _lastScrollPosition = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels > _lastScrollPosition) {
      if (!_isScrollingUp) {
        setState(() {
          _isScrollingUp = true;
        });
      }
    } else {
      if (_isScrollingUp) {
        setState(() {
          _isScrollingUp = false;
        });
      }
    }
    _lastScrollPosition = _scrollController.position.pixels;
  }

  @override
  void dispose() {
    _removeOverlay();
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _animationController.reverse();
  }

  void _showOverlay(BuildContext context) {
    _removeOverlay();

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width * .6,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ScaleTransition(
                scale: _animation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildMenuItem(context, 'Home', 'home'),
                    _buildDivider(context),
                    _buildMenuItem(context, 'About', 'about'),
                    _buildDivider(context),
                    _buildMenuItem(context, 'Projects', 'projects'),
                    _buildDivider(context),
                    _buildMenuItem(context, 'Tech Stack', 'tech stack'),
                    _buildDivider(context),
                    _buildMenuItem(context, 'Certificates', 'certificates'),
                    _buildDivider(context),
                    _buildMenuItem(context, 'Contact', 'contact'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: 0.5,
      thickness: 0.5,
      color: Theme.of(context).primaryColor.withOpacity(0.1),
    );
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: isActive
                ? theme.primaryColor.withOpacity(0.15)
                : Colors.transparent,
            gradient: isActive
                ? LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      theme.primaryColor.withOpacity(0.1),
                      theme.primaryColor.withOpacity(0.05),
                    ],
                  )
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isActive
                      ? theme.primaryColor
                      : theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              if (isActive)
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: theme.primaryColor,
                ),
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

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: Matrix4.translationValues(0, _isScrollingUp ? -100 : 0, 0),
      child: Container(
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
                  if (size.width > 655) ...[
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
                      onPressed: () =>
                          homeController.changeSection('tech stack'),
                    ),
                    _NavButton(
                      label: 'Certificates',
                      onPressed: () =>
                          homeController.changeSection('certificates'),
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
                        'https://www.linkedin.com/in/fady-saied-engineer/'),
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
