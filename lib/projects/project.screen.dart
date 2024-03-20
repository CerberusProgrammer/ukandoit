import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/projects/project.model.dart';

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
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.project.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ),
        ],
      ),
      appBarColor: widget.project.color,
      headerWidget: AppBar(
        excludeHeaderSemantics: true,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'uKandoit',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: widget.project.color,
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
        Text('Body'),
      ],
    );
  }
}
