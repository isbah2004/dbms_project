class Todo {
  final String taskId;
  final String userId;
  final String title;
  final String task;
  final DateTime creationDate;

  Todo({
    required this.taskId,
    required this.userId,
    required this.title,
    required this.task,
    required this.creationDate,
  });

  // Convert a Todo into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'userId': userId,
      'title': title,
      'task': task,
      'creationDate': creationDate.toIso8601String(),
    };
  }

factory Todo.fromMap(Map<String, dynamic> map) {
  return Todo(
    taskId: map['taskId'],
    userId: map['userId'],
    title: map['title'],
    task: map['task'],
    creationDate: DateTime.parse(map['creationDate']),
  );
}
}