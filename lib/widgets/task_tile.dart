import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final ValueChanged<bool?> onChanged;

  const TaskTile({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onChanged,
  });

@override
Widget build(BuildContext context) {
return Card(
  margin: const EdgeInsets.only(bottom: 12),
  elevation: 2,
  shadowColor: Colors.black.withValues(alpha: 0.08),
    shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(16),
),
color: task.isCompleted
    ? const Color(0xFFEAF0E6)
    : Colors.white,
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(
  horizontal: 14,
  vertical: 6,
),
      leading: Checkbox(
  value: task.isCompleted,
  onChanged: onChanged,
  activeColor: const Color(0xFF87A878),
),
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: 16,
          decoration:
              task.isCompleted ? TextDecoration.lineThrough : null,
          color: task.isCompleted ? Colors.grey : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(
  Icons.delete_outline,
  color: Colors.grey,
),
        onPressed: onDelete,
      ),
    ),
  );
}
}