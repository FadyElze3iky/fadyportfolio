import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  final isLoading = false.obs;

  Future<void> sendEmail() async {
    try {
      isLoading.value = true;

      // Get form data
      final email = emailController.text;
      final name = nameController.text;
      final subject = subjectController.text;
      final message = messageController.text;

      // Create email URI
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'fadysaied63@gmail.com', // Replace with your email address
        queryParameters: {
          'subject': subject,
          'body': 'Name: $name\nEmail: $email\n\nMessage:\n$message',
        },
      );

      // Launch email app
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
        // Clear form after successful submission
        clearForm();
      } else {
        throw Exception('Could not launch email app');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to open email app. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> launchEmail(Uri emailUri) async {
    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        throw Exception('Could not launch email app');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to open email app. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw Exception('Could not launch URL');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to open URL. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void clearForm() {
    emailController.clear();
    nameController.clear();
    subjectController.clear();
    messageController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
