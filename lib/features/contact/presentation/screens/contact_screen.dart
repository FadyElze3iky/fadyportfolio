import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import '../widgets/contact_section.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ContactController>()) {
      Get.put(ContactController());
    }
    // final contactController = Get.find<ContactController>();

    return const SingleChildScrollView(
      child: Column(
        children: const [
          ContactSection(),
        ],
      ),
    );
  }
}
