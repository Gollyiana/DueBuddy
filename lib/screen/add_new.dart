// add_new.dart
import 'package:flutter/material.dart';

class AddNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Due")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(labelText: "Assignment Name")),
            TextField(decoration: InputDecoration(labelText: "Type")),
            TextField(decoration: InputDecoration(labelText: "Deadline")),
            TextField(decoration: InputDecoration(labelText: "Description")),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Save")),
                OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
