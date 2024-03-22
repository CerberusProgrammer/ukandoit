import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/projects/project.controller.dart';
import 'package:ukandoit/projects/projects.screen.dart';
import 'package:ukandoit/tables/table.controller.dart';
import 'package:ukandoit/theme/theme.controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(ProjectController());
        Get.put(TableController());
      }),
      theme: themeController.themeData,
      home: const ProjectsScreen(),
    );
  }
}
