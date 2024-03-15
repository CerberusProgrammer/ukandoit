class Task {
  String name;
  DateTime? completedAt;
  DateTime? finishedAt;
  String? description;

  bool completed;

  Task({
    required this.name,
    this.description,
    required this.completed,
    this.completedAt,
    this.finishedAt,
  });
}
