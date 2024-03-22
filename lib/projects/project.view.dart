import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/projects/project.model.dart';
import 'package:ukandoit/tables/table.controller.dart';
import 'package:ukandoit/tables/table.create.dart';
import 'package:ukandoit/widgets/ukan.floatingbutton.dart';
import 'package:ukandoit/widgets/ukan.task-card.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final tableController = Get.find<TableController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DraggableHome(
        alwaysShowLeadingAndAction: true,
        centerTitle: true,
        alwaysShowTitle: true,
        appBarColor: widget.project.color,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text(
          widget.project.name,
          style: const TextStyle(color: Colors.white),
        ),
        headerWidget: Container(
          color: widget.project.color,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.project.description ?? 'Sin descripcion',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        body: List.generate(
          tableController.tables.length,
          (index) => UkanTaskCard(
            color: tableController.tables[index].color ?? widget.project.color!,
            title: tableController.tables[index].name,
            description: tableController.tables[index].description ?? '',
            progress: 0,
            onTap: () {},
            tasksData: const [],
          ),
        ),
        floatingActionButton: UkanFloatingButton(
          color: widget.project.color,
          icon: Icons.add,
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (builder) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TableCreate(
                project: widget.project,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
