import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
   final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF1E88E5),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'user@example.com',
                    style: TextStyle(
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.settings,
                              color: Color(0xFF757575)),
                          title: const Text(
                            'Settings',
                            style: TextStyle(color: Color(0xFF212121)),
                          ),
                          onTap: () {},
                        ),
                        const Divider(height: 1, color: Color(0xFFEEEEEE)),
                        ListTile(
                          leading: const Icon(Icons.notifications,
                              color: Color(0xFF757575)),
                          title: const Text(
                            'Notifications',
                            style: TextStyle(color: Color(0xFF212121)),
                          ),
                          onTap: () {},
                        ),
                        const Divider(height: 1, color: Color(0xFFEEEEEE)),
                        ListTile(
                          leading:
                              const Icon(Icons.help, color: Color(0xFF757575)),
                          title: const Text(
                            'Help & Support',
                            style: TextStyle(color: Color(0xFF212121)),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD32F2F),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
