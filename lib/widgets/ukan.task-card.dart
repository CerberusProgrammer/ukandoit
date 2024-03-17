import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/theme/theme.controller.dart';

class TaskValue {
  final int quantity;
  final IconData icon;

  TaskValue({
    required this.quantity,
    required this.icon,
  });
}

class UkanTaskCard extends StatelessWidget {
  const UkanTaskCard({
    super.key,
    required this.color,
    required this.title,
    required this.description,
    required this.progress,
    required this.onTap,
    required this.tasksData,
  });

  final Color color;
  final String title;
  final String description;
  final double progress;
  final Function() onTap;
  final List<TaskValue> tasksData;

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<ThemeController>().isDarkTheme.value;

    return InkWell(
      child: Card(
        elevation: 1,
        surfaceTintColor: isDark ? Colors.black : Colors.white,
        color: isDark ? Colors.black : Colors.white,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          splashColor: color.withOpacity(0.25),
          hoverColor: color.withOpacity(0.05),
          focusColor: color.withOpacity(0.05),
          highlightColor: color.withOpacity(0.15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Card(
                      elevation: 0,
                      color: color.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    PopupMenuButton<String>(
                      color: color,
                      tooltip: 'Options',
                      shadowColor: Colors.transparent,
                      iconColor: color,
                      icon: Icon(
                        Icons.more_horiz,
                        color: color,
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'editar',
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.edit, color: Colors.white),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Editar',
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'eliminar',
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.delete, color: Colors.white),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Eliminar',
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ],
                      onSelected: (String value) {
                        if (value == 'editar') {
                          // Acción para editar
                        } else if (value == 'eliminar') {
                          // Acción para eliminar
                        }
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: color),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 4, right: 8),
                      child: Text(
                        '${(progress * 100).toStringAsFixed(0)}%',
                        style: TextStyle(
                          fontSize: 18,
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    LinearProgressIndicator(
                      value: progress,
                      borderRadius: BorderRadius.circular(8),
                      color: color,
                      backgroundColor: color.withOpacity(0.1),
                      minHeight: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 4, top: 12, right: 8, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      tasksData.length,
                      (index) => Row(
                        children: [
                          Icon(
                            tasksData[index].icon,
                            color: color,
                          ),
                          Text(
                            '${tasksData[index].quantity}',
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
