class Task {
  String? id, name, description, type, assigned_to, status;
  List<Task>? children;

  Task({
    this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.assigned_to,
    this.status,
    this.children,
  });

  Task.fromJson({required Map<String, dynamic> task}) {
    id = task['id'];
    name = task['name'];
    description = task['description'];
    type = task['type'];
    assigned_to = task['assigned_to'];
    status = task['status'];
    children = task['children'];
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'type': type,
        'assigned_to': assigned_to,
        'status': status,
        'children': children,
      };
}
