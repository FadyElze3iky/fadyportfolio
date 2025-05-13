import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/certificates_controller.dart';
import '../widgets/certificates_section.dart';

class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CertificatesController>()) {
      Get.put(CertificatesController());
    }
    // final certificatesController = Get.find<CertificatesController>();

    return const SingleChildScrollView(
      child: Column(
        children: [
          CertificatesSection(),
        ],
      ),
    );
  }
}
