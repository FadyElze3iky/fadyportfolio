import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tech_stack_controller.dart';
import '../widgets/tech_stack_section.dart';

class TechStackScreen extends StatelessWidget {
  const TechStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<TechStackController>()) {
      Get.put(TechStackController());
    }
    // final techStackController = Get.find<TechStackController>();

    return const SingleChildScrollView(
      child: Column(
        children: const [
          TechStackSection(),
        ],
      ),
    );
  }
}
