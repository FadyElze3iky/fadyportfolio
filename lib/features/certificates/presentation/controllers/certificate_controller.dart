import 'package:get/get.dart';

class CertificateController extends GetxController {
  CertificateController();

  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final certificates = [
    {
      'imgPath': 'assets/images/certificate3.jpg',
      'name': 'Microsoft IT Support Specialist',
      'url': 'https://coursera.org/share/e12daa640c4f9d39422ecaa4e96c7836',
    },
    {
      'imgPath': 'assets/images/certificate1.jpg',
      'name': 'IBM Machine Learning',
      'url': 'https://coursera.org/share/c76045d9fd786de050eab7f3cfa31f95',
    },
    {
      'imgPath': 'assets/images/certificate2.jpg',
      'name': 'IBM Introduction to Machine Learning',
      'url': 'https://coursera.org/share/daba5273d55bdf169ed49f2cfb22c34a',
    },
  ];
}
