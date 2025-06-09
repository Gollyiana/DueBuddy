import 'package:flutter/material.dart';
import 'profile.dart';
import 'due.listing.page.dart';

class AppDrawer extends StatelessWidget {
  final String username;
  final List<Map<String, dynamic>> allDeadlines;
  final Future<void> Function() onAddNew;

  const AppDrawer({
    super.key,
    required this.username,
    required this.allDeadlines,
    required this.onAddNew,
  });

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

          // Assignment
          ListTile(
            leading: const Icon(Icons.assignment, color: Color(0xFF757575)),
            title: const Text('Assignment',
                style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DueListingPage(
                    type: 'Assignment',
                    allDeadlines: allDeadlines,
                    onAddNew: onAddNew,
                  ),
                ),
              );
            },
          ),

          // Quiz
          ListTile(
            leading: const Icon(Icons.quiz, color: Color(0xFF757575)),
            title: const Text('Quiz', style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DueListingPage(
                    type: 'Quiz',
                    allDeadlines: allDeadlines,
                    onAddNew: onAddNew,
                  ),
                ),
              );
            },
          ),

          // Test
          ListTile(
            leading: const Icon(Icons.text_snippet, color: Color(0xFF757575)),
            title: const Text('Test', style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DueListingPage(
                    type: 'Test',
                    allDeadlines: allDeadlines,
                    onAddNew: onAddNew,
                  ),
                ),
              );
            },
          ),

          // Task
          ListTile(
            leading: const Icon(Icons.task, color: Color(0xFF757575)),
            title: const Text('Task', style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DueListingPage(
                    type: 'Task',
                    allDeadlines: allDeadlines,
                    onAddNew: onAddNew,
                  ),
                ),
              );
            },
          ),

          // Calendar
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Color(0xFF757575)),
            title: const Text('Calendar', style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/calendar');
            },
          ),

          // Profile
          ListTile(
            leading: const Icon(Icons.person, color: Color(0xFF757575)),
            title: const Text('Profile', style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: username),
                ),
              );
            },
          ),

          const Divider(color: Color(0xFFEEEEEE)),

          // Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF757575)),
            title: const Text('Log out', style: TextStyle(color: Color(0xFF212121))),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
