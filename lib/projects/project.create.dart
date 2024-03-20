import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/projects/project.controller.dart';
import 'package:ukandoit/projects/project.model.dart';
import 'package:ukandoit/widgets/ukan.floatingbutton.dart';

class ProjectsCreate extends StatefulWidget {
  const ProjectsCreate({super.key});

  @override
  State<ProjectsCreate> createState() => _ProjectsCreateState();
}

class _ProjectsCreateState extends State<ProjectsCreate> {
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  final descriptionController = TextEditingController();

  int selectedColor = 0;
  final List<Color> colors = [
    Colors.indigo,
    Colors.green,
    Colors.purple,
    Colors.pink,
    Colors.red,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    final projectController = Get.find<ProjectController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('New project'),
        backgroundColor: colors[selectedColor],
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          children: [
            TextFormField(
              onChanged: (value) => setState(() {
                nameController.text = value;
              }),
              controller: nameController,
              cursorColor: colors[selectedColor],
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colors[selectedColor],
                ),
                filled: true,
                fillColor: colors[selectedColor].withOpacity(0.25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return 'No empty name.';
                  }
                } else {
                  return 'Error';
                }

                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: (value) => setState(() {
                descriptionController.text = value;
              }),
              cursorColor: colors[selectedColor],
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colors[selectedColor],
                ),
                filled: true,
                fillColor: colors[selectedColor].withOpacity(0.25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.name,
            ),
            ListTile(
              title: const Text('Select a color for your project'),
              subtitle: Row(
                children: List.generate(
                  colors.length,
                  (index) => IconButton(
                    onPressed: () {
                      setState(() {
                        selectedColor = index;
                      });
                    },
                    color: colors[index],
                    focusColor: colors[index],
                    hoverColor: colors[index].withOpacity(0.2),
                    splashColor: colors[index].withOpacity(0.3),
                    highlightColor: colors[index].withOpacity(0.3),
                    icon: Icon(
                      selectedColor == index
                          ? Icons.circle
                          : Icons.circle_outlined,
                      color: colors[index],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Card(
                elevation: 0,
                color: colors[selectedColor],
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    children: [
                      Text(
                        nameController.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      if (descriptionController.text.isNotEmpty)
                        Text(
                          descriptionController.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: UkanFloatingButton(
        color: colors[selectedColor],
        icon: Icons.done,
        onTap: () {
          if (formKey.currentState!.validate()) {
            projectController.projects.add(
              Project(
                name: nameController.text,
                description: descriptionController.text,
                color: colors[selectedColor],
                tables: [],
              ),
            );
            Get.back();
          }
        },
      ),
    );
  }
}
