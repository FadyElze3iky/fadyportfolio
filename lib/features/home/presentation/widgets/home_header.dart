import 'package:fadyportfolio/features/home/presentation/widgets/header.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Header(theme: theme);
  }
}
