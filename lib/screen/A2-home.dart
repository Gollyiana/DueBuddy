import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'deadline_listing.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DueBuddy'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello $username,',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const Text(
              'ready to crush your tasks today?',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF757575),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Chip(
                    label: const Text('Assignment due'),
                    backgroundColor: const Color(0xFF1E88E5).withOpacity(0.2),
                    labelStyle: const TextStyle(color: Color(0xFF1E88E5)),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: const Text('Task overdue'),
                    backgroundColor: const Color(0xFFD32F2F).withOpacity(0.2),
                    labelStyle: const TextStyle(color: Color(0xFFD32F2F)),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: const Text('Deadlines'),
                    backgroundColor: const Color(0xFF388E3C).withOpacity(0.2),
                    labelStyle: const TextStyle(color: Color(0xFF388E3C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: DeadlineListing(
                deadlines: [
                  {'name': 'Math Homework', 'days': '7 days'},
                  {'name': 'Science Project', 'days': '14 days'},
                  {'name': 'History Essay', 'days': '21 days'},
                  {'name': 'English Quiz', 'days': '21 days'},
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNew');
        },
        backgroundColor: const Color(0xFF1E88E5),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
