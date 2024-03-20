import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/projects/project.controller.dart';
import 'package:ukandoit/projects/project.create.dart';
import 'package:ukandoit/projects/project.edit.dart';
import 'package:ukandoit/projects/project.screen.dart';
import 'package:ukandoit/theme/theme.controller.dart';
import 'package:ukandoit/widgets/ukan.floatingbutton.dart';
import 'package:ukandoit/widgets/ukan.task-card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projectController = Get.find<ProjectController>();
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      body: Obx(
        () => DraggableHome(
          title: Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Projects',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SearchAnchor(
                    viewElevation: 1,
                    viewHintText: 'Search projects',
                    dividerColor:
                        Get.find<ThemeController>().primaryColor.value,
                    viewBackgroundColor: Colors.white,
                    isFullScreen: true,
                    suggestionsBuilder: ((context, controller) {
                      return [];
                    }),
                    builder: (context, controller) {
                      return const Icon(
                        Icons.search,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          appBarColor: Get.find<ThemeController>().primaryColor.value,
          headerWidget: AppBar(
            excludeHeaderSemantics: true,
            toolbarHeight: 100,
            title: const Text(
              'uKandoit',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Get.find<ThemeController>().primaryColor.value,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: [
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children:
                  List.generate(projectController.projects.length, (index) {
                final color = projectController.projects[index].color ??
                    themeController.primaryColor.value;

                return UkanTaskCard(
                  color: color,
                  title: projectController.projects[index].name,
                  description: projectController.projects[index].description ??
                      "Without description.",
                  progress: 0.3,
                  onTap: () => Get.to(
                    () => ProjectScreen(
                      project: projectController.projects[index],
                    ),
                    transition: Transition.cupertino,
                  ),
                  onEdit: () => Get.to(
                    () => ProjectEdit(
                      project: projectController.projects[index],
                    ),
                    transition: Transition.cupertino,
                  ),
                  onRemove: () => projectController.removeProject(
                    projectController.projects[index],
                  ),
                  tasksData: [
                    TaskValue(quantity: 10, icon: Icons.task),
                    TaskValue(quantity: 2, icon: Icons.task),
                  ],
                );
              }),
            )
          ],
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
