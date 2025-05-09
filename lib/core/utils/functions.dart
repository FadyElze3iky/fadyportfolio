import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  static void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      Get.snackbar(
        'Error',
        'Could not launch $url',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
