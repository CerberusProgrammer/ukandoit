import 'package:flutter/material.dart';

class Project {
  String name;
  List<Table> tables;
  String? description;
  Color? color;
  Icon? icon;

  Project({
    required this.name,
    required this.tables,
    this.description,
    this.color,
    this.icon,
  });

  Map<String, dynamic> toJSON() => {
        "name": name,
        "tables": tables,
        "description": description,
        "color": color,
        "icon": icon,
      };

  @override
  String toString() {
    return '${toJSON()}';
  }
}
