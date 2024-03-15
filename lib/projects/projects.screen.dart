import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/projects/project.controller.dart';
import 'package:ukandoit/projects/projects.create.dart';
import 'package:ukandoit/theme/theme.controller.dart';
import 'package:ukandoit/widgets/ukan.floatingbutton.dart';
import 'package:ukandoit/widgets/ukan.task-card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projectController = Get.find<ProjectController>().projects;
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: List.generate(projectController.length, (index) {
            final color = projectController[index].color ??
                themeController.primaryColor.value;

            return UkanTaskCard(
              color: color,
              title: projectController[index].name,
              description: projectController[index].description ??
                  "Without description.",
              progress: 0.3,
              onTap: () {},
              tasksData: [
                TaskValue(quantity: 10, icon: Icons.task),
                TaskValue(quantity: 10, icon: Icons.task),
              ],
            );
          }),
        ),
      ),
      floatingActionButton: UkanFloatingButton(
        icon: Icons.add,
        onTap: () => Get.to(
          () => const ProjectsCreate(),
          transition: Transition.cupertino,
        ),
      ),
    );
  }
}
