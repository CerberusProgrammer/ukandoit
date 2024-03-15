import 'package:flutter/material.dart';

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
    return InkWell(
      child: Card(
        elevation: 1,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
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
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    LinearProgressIndicator(
                      value: progress,
                      borderRadius: BorderRadius.circular(8),
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
                          ),
                          Text('${tasksData[index].quantity}'),
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
