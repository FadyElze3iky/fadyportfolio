import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fadyportfolio/features/tech_stack/data/repositories/tech_stack_repository_impl.dart';
import 'package:fadyportfolio/features/tech_stack/domain/usecases/fetch_tech_stack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tech_stack_controller.dart';
import '../widgets/tech_stack_item_widget.dart';

class TechStackScreen extends StatelessWidget {
  const TechStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 760;
    final isMedium = MediaQuery.of(context).size.width < 1200;
    final theme = Theme.of(context);

    if (!Get.isRegistered<TechStackController>()) {
      Get.put(TechStackController(
          FetchTechStack(TechStackRepositoryImpl(FirebaseFirestore.instance))));
    }
    if (!Get.isRegistered<TickerProvider>()) {
      Get.put(TickerProvider);
    }
    final techStackController = Get.find<TechStackController>();

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
                  Text(
                    'Tech Stack',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'The dev & design tools I use.',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Divider(
              color: theme.dividerColor,
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() {
            if (techStackController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (techStackController.error.isNotEmpty) {
              return Center(
                  child: Text('Error: \\${techStackController.error}'));
            }
            final items = techStackController.techStack;
            if (!isMobile) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMedium ? 2 : 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return TechStackItemWidget(
                      url: item.url,
                      name: item.name,
                      type: item.type,
                      iconUrl: item.icon,
                    );
                  },
                ),
              );
            }
            return SizedBox();
          }),
        ],
      ),
    );
  }
}
