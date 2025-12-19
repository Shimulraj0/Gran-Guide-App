import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'core/theme/app_theme.dart';

import 'app/controllers/theme_controller.dart';

void main() {
  Get.put(ThemeController()); // Global Theme Controller
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const GranGuideApp(),
    ),
  );
}

class GranGuideApp extends StatelessWidget {
  const GranGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Gran Guide',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes, // Ensure this returns a List<GetPage<dynamic>>
    );
  }
}
