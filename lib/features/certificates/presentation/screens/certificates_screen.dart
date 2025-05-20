import 'package:fadyportfolio/features/certificates/presentation/controllers/certificate_controller.dart';
import 'package:fadyportfolio/features/certificates/presentation/widgets/certificate_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CertificateController());
    final controller = Get.find<CertificateController>();
    final certificates = controller.certificates;
    final isMobile = MediaQuery.of(context).size.width < 655;
    final theme = Theme.of(context);

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
                      ? SelectableText(
                          'Certificates',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 60,
                          ),
                        )
                      : SelectableText(
                          'Certificates',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  SelectableText(
                    'Certificates I have earned',
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
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              children: [
                CertificateCard(
                    imgPath: certificates[0]['imgPath'] ?? '',
                    name: certificates[0]['name'] ?? '',
                    url: certificates[0]['url'] ?? ''),
                CertificateCard(
                    imgPath: certificates[1]['imgPath'] ?? '',
                    name: certificates[1]['name'] ?? '',
                    url: certificates[1]['url'] ?? ''),
                CertificateCard(
                    imgPath: certificates[2]['imgPath'] ?? '',
                    name: certificates[2]['name'] ?? '',
                    url: certificates[2]['url'] ?? ''),
                const CertificateCard(
                  imgPath: 'assets/images/see_in_linkedin.png',
                  name: 'See more on LinkedIn',
                  url: 'https://www.linkedin.com/in/fady-saied-engineer/',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
