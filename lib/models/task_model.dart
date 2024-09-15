class Task {
  int? id;
  String title;
  bool isCompleted;
  int priority;

  Task({
    this.id,
    required this.title,
    this.isCompleted = false,
    this.priority = 0,
  });
}