import 'package:flutter/material.dart';
import 'deadline_listing.dart';
import 'profile.dart';
import 'app_drawer.dart'; // ✅ This line is required

class HomePage extends StatelessWidget {
  final String userName = "John";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DueBuddy'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
              // Alternative (if this causes error):
              // ScaffoldMessenger.of(context).openEndDrawer();
              // Or assign a GlobalKey<ScaffoldState> and use that to open drawer
            },
          )
        ],
      ),
      endDrawer: const AppDrawer(), // Mark AppDrawer const if possible
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello $userName,\nReady to crush your tasks today?",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Expanded(child: DeadlineListing()),
          ],
        ),
      ),
    );
  }
}
