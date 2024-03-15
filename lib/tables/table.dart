import 'package:flutter/material.dart';
import 'package:ukandoit/tasks/task.dart';

class Table {
  String name;
  List<Task> tasks;
  String? description;
  Color? color;
  Icon? icon;

  Table({
    required this.name,
    required this.tasks,
    this.description,
    this.color,
    this.icon,
  });
}
