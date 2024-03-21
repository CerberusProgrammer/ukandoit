import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      body: DraggableHome(
        title: const Text('title'),
        appBarColor: widget.project.color,
        headerWidget: const Text('XD'),
        body: const [
          Text('Body'),
        ],
      ),
    );
  }
}
