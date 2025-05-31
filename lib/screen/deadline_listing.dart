// deadline_listing.dart
import 'package:flutter/material.dart';

class Task {
  final String title;
  final int daysLeft;
  final String priority;

  Task({required this.title, required this.daysLeft, required this.priority});
}

Color getUrgencyColor(int daysLeft) {
  if (daysLeft <= 3) return Colors.red;
  if (daysLeft <= 7) return Colors.orange;
  return Colors.green;
}

class DeadlineListing extends StatelessWidget {
  final List<Task> tasks = [
    Task(title: "Assignment 1", daysLeft: 2, priority: "High"),
    Task(title: "Assignment 2", daysLeft: 7, priority: "Medium"),
    Task(title: "Assignment 3", daysLeft: 14, priority: "Low"),
  ];

  @override
  Widget build(BuildContext context) {
    tasks.sort((a, b) => a.priority.compareTo(b.priority));

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Card(
          color: getUrgencyColor(task.daysLeft).withOpacity(0.1),
          child: ListTile(
            title: Text(task.title),
            subtitle: Text("${task.daysLeft} days • ${task.priority} priority"),
            trailing: Icon(Icons.arrow_forward_ios,
                color: getUrgencyColor(task.daysLeft)),
          ),
        );
      },
    );
  }
}
