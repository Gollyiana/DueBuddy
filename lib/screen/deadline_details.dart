// deadline_details.dart
import 'package:flutter/material.dart';

class DeadlineDetailsPage extends StatelessWidget {
  final String title;
  final String type;
  final String description;
  final String deadline;

  DeadlineDetailsPage({
    required this.title,
    required this.type,
    required this.description,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deadline Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: $title", style: TextStyle(fontSize: 18)),
            Text("Type: $type", style: TextStyle(fontSize: 16)),
            Text("Deadline: $deadline", style: TextStyle(fontSize: 16)),
            Text("Description: $description", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
