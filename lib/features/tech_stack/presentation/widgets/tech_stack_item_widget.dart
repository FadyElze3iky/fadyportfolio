import 'package:fadyportfolio/core/utils/functions.dart';
import 'package:flutter/material.dart';
import 'background_painter.dart';

class TechStackItemWidget extends StatefulWidget {
  final String name;
  final String type;
  final String iconUrl;
  final String url;
  final bool isMobile;

  const TechStackItemWidget({
    required this.name,
    required this.type,
    required this.iconUrl,
    required this.url,
    this.isMobile = false,
    super.key,
  });

  @override
  State<TechStackItemWidget> createState() => _TechStackItemWidgetState();
}

class _TechStackItemWidgetState extends State<TechStackItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shadowAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _shadowAnimation = Tween<double>(begin: 0.08, end: 0.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    if (isHovered) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: GestureDetector(
              onTap: () {
                _handleHover(true);
                Future.delayed(const Duration(milliseconds: 200), () {
                  _handleHover(false);
                  Functions.launchURL(widget.url);
                });
              },
              child: Container(
                  height: 200,
                  width: widget.isMobile ? double.infinity : 200,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: theme.dividerColor,
                      width: _isHovered ? 2 : 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            theme.cardColor.withOpacity(_shadowAnimation.value),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      if (_isHovered)
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: const BlurredBackground(),
                          ),
                        ),
                      if (!widget.isMobile) ...[
                        Align(
                          child: Image.network(
                            widget.iconUrl,
                            scale: 2.2,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.broken_image, size: 48),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SelectableText(widget.name,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                        color: theme.hoverColor,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.normal)),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: theme.cardColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: theme.dividerColor, width: 1.5),
                                  ),
                                  child: SelectableText(widget.type,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: Colors.grey,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )
                      ] else ...[
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                if (_isHovered)
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: const BlurredBackground(),
                                    ),
                                  ),
                                Image.network(
                                  widget.iconUrl,
                                  scale: 3,
                                  errorBuilder: (_, __, ___) =>
                                      const Icon(Icons.broken_image, size: 48),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                !widget.isMobile
                                    ? SelectableText(
                                        widget.name,
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(
                                                color: theme.hoverColor,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.normal),
                                      )
                                    : SelectableText(
                                        widget.name,
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                color: theme.hoverColor,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.normal),
                                      ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: theme.cardColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: theme.dividerColor, width: 1.5),
                                  ),
                                  child: SelectableText(widget.type,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: Colors.grey,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
