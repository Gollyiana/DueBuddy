// ignore: file_names
import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'deadline_details.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> allDeadlines = [
    {'title': 'Math Homework', 'dueDate': DateTime.now().add(Duration(days: 7)), 'category': 'Upcoming'},
    {'title': 'Science Project', 'dueDate': DateTime.now().add(Duration(days: 14)), 'category': 'Upcoming'},
    {'title': 'History Essay', 'dueDate': DateTime.now().subtract(Duration(days: 2)), 'category': 'Overdue'},
    {'title': 'English Quiz', 'dueDate': null, 'category': 'Done'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DueBuddy'),
      ),
      drawer: AppDrawer(username: widget.username),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${widget.username} 👋',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(
              'ready to crush your tasks today?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Upcoming', 'Overdue', 'Done'].map((category) {
                  final isSelected = selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      selectedColor: Colors.blue.shade100,
                      backgroundColor: Colors.grey.shade200,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _getFilteredDeadlines().isEmpty
                  ? const Center(child: Text('No tasks here. 🎉'))
                  : ListView(
                      children: _getFilteredDeadlines().map((task) {
                        return _buildDeadlineCard(
                          task['title'],
                          task['dueIn'],
                          task['category'],
                          task['description'],
                        );
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
    final newTask = await Navigator.pushNamed(context, '/addNew');
    if (newTask != null && newTask is Map<String, dynamic>) {
      setState(() {
        allDeadlines.add({
          'title': newTask['title'],
          'category': _getCategoryFromDate(newTask['dueDate']),
          'dueDate': newTask['dueDate'],
          'description': newTask['description'],
        });
         selectedCategory = 'All';
      });
    }
  },
        backgroundColor: const Color(0xFF1E88E5),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildDeadlineCard(String title, String dueIn, String category, String description) {
    Color cardColor;
    Icon cardIcon;

    switch (category) {
      case 'Upcoming':
        cardColor = Colors.orange.shade100;
        cardIcon = const Icon(Icons.schedule, color: Colors.orange);
        break;
      case 'Overdue':
        cardColor = Colors.red.shade100;
        cardIcon = const Icon(Icons.warning, color: Colors.red);
        break;
      case 'Done':
        cardColor = Colors.green.shade100;
        cardIcon = const Icon(Icons.check_circle, color: Colors.green);
        break;
      default:
        cardColor = Colors.grey.shade200;
        cardIcon = const Icon(Icons.assignment, color: Colors.grey);
    }

    return Card(
      color: cardColor,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: cardIcon,
        title: Text(title),
        subtitle: Text('Due in $dueIn'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeadlineDetails(
                name: title,
                type: category,
                description: description ?? 'No description available',
                deadline: dueIn,
              ),
            ),
          );

           // ✅ If task was marked as completed
           if (result == true) {
              setState(() {
                allDeadlines.removeWhere((task) => task['title'] == title);
              });
            }
        },
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredDeadlines() {
  List<Map<String, dynamic>> filtered = selectedCategory == 'All'
      ? allDeadlines
      : allDeadlines.where((task) => task['category'] == selectedCategory).toList();

  return filtered.map((task) {
    final DateTime? dueDate = task['dueDate'];
    String dueIn;

    if (dueDate == null) {
      dueIn = 'No due date';
    } else {
      final difference = dueDate.difference(DateTime.now());
      if (difference.isNegative) {
        dueIn = '${-difference.inDays} day(s) ago';
      } else if (difference.inDays == 0) {
        dueIn = 'Today';
      } else {
        dueIn = 'in ${difference.inDays} day(s)';
      }
    }

      return {
      'title': task['title'],
      'dueDate': dueDate,
      'dueIn': dueIn,
      'category': task['category'],
      'description': task['description'] ?? '',
    };
  }).toList();
}

      String _getCategoryFromDate(DateTime? dueDate) {
    if (dueDate == null) return 'Done';
    final now = DateTime.now();
    return dueDate.isBefore(now) ? 'Overdue' : 'Upcoming';
  }
}
