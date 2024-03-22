import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/projects/project.model.dart';
import 'package:ukandoit/tables/table.controller.dart';
import 'package:ukandoit/widgets/ukan.floatingbutton.dart';
import 'package:ukandoit/tables/table.model.dart' as tm;

class TableCreate extends StatefulWidget {
  const TableCreate({super.key, required this.project});

  final Project project;

  @override
  State<TableCreate> createState() => _TableCreateState();
}

class _TableCreateState extends State<TableCreate> {
  final tableController = Get.find<TableController>();
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
  void initState() {
    selectedColor = colors.indexWhere((color) => color == widget.project.color);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Create new table'),
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
              autofocus: true,
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
              title: const Text('Select a color for your table'),
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
          ],
        ),
      ),
      floatingActionButton: UkanFloatingButton.small(
        color: widget.project.color,
        icon: Icons.done,
        onTap: () {
          if (formKey.currentState!.validate()) {
            tableController.tables.add(
              tm.Table(
                name: nameController.text,
                description: descriptionController.text,
                color: colors[selectedColor],
                tasks: [],
              ),
            );
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
