// profile.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username = "John Doe";
  final String email = "john@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
                radius: 50, backgroundImage: AssetImage("assets/profile.png")),
            SizedBox(height: 20),
            Text(username,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(email, style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 30),
            ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
            ListTile(
                leading: Icon(Icons.help_outline),
                title: Text("Help & Support")),
            ListTile(leading: Icon(Icons.logout), title: Text("Log out")),
          ],
        ),
      ),
    );
  }
}
