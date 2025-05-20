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

    final isMobile = MediaQuery.of(context).size.width < 655;
    final theme = Theme.of(context);
    // final contactController = Get.find<ContactController>();

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: isMobile
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.7,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isMobile
                      ? Text(
                          'Get in\ntouch',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Text(
                          'Get in touch',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  Text(
                    'Let’s build something awesome.',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: isMobile
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.7,
            child: Divider(
              color: theme.colorScheme.onSurface.withOpacity(0.1),
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: isMobile
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.7,
            child: const ContactFormSection(),
          ),
        ],
      ),
    );
  }
}
