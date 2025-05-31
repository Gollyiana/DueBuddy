import 'package:flutter/material.dart';
import 'calendar.dart';
import 'profile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF1E88E5),
            ),
            child: Text(
              'DueBuddy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.assignment, color: Color(0xFF757575)),
            title: const Text('Assignment',
                style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.quiz, color: Color(0xFF757575)),
            title:
                const Text('Quiz', style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.text_snippet, color: Color(0xFF757575)),
            title:
                const Text('Test', style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.task, color: Color(0xFF757575)),
            title:
                const Text('Task', style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Color(0xFF757575)),
            title: const Text('Calendar',
                style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pushNamed(context, '/calendar');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Color(0xFF757575)),
            title: const Text('Profile',
                style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          const Divider(color: Color(0xFFEEEEEE)),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF757575)),
            title: const Text('Log out',
                style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
