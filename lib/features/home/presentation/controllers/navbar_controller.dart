import 'package:fadyportfolio/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  final RxBool isMenuOpen = false.obs;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  LayerLink get layerLink => _layerLink;

  void toggleMenu(BuildContext context) {
    if (isMenuOpen.value) {
      _removeOverlay();
    } else {
      _showOverlay(context);
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    isMenuOpen.value = false;
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
                  _buildMenuItem(context, 'Certificats', 'certificats'),
                  _buildMenuItem(context, 'Contact', 'contact'),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    isMenuOpen.value = true;
  }

  Widget _buildMenuItem(BuildContext context, String label, String section) {
    final theme = Theme.of(context);
    final homeController = Get.find<HomeController>();

    return Obx(() {
      final isActive = homeController.currentSection == section;
      return InkWell(
        onTap: () {
          _removeOverlay();
          isMenuOpen.value = false;
          homeController.changeSection(section);
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
  void onClose() {
    _removeOverlay();
    super.onClose();
  }
}
