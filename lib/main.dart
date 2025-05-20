import 'package:fadyportfolio/core/secure/keys.dart';
import 'package:fadyportfolio/features/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: apiKey,
        appId: appId,
        messagingSenderId: messagingSenderId,
        projectId: projectId),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initialize theme controller
  Get.put(ThemeController());

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fady Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
      home: const HomeView(),
    );
  }
}
