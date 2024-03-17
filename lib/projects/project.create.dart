import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/projects/project.controller.dart';
import 'package:ukandoit/projects/project.model.dart';
import 'package:ukandoit/widgets/ukan.floatingbutton.dart';

class ProjectsCreate extends StatelessWidget {
  const ProjectsCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final projectController = Get.find<ProjectController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('New project'),
      ),
      floatingActionButton: UkanFloatingButton(
        icon: Icons.done,
        onTap: () {
          projectController.projects.add(
            Project(
              name: 'New',
              color: Colors.pink,
              tables: [],
            ),
          );
          Get.back();
        },
      ),
    );
  }
}
