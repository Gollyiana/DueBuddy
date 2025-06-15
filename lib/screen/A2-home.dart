// ignore: file_names
import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'deadline_details.dart';
import 'due.listing.page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _allDeadlines = [];
  String selectedCategory = 'All';
  String _searchQuery = '';
  bool _isSearching = false;

  void _addNewDue(Map<String, dynamic> newDue) {
    setState(() {
      _allDeadlines.add(newDue);
    });
  }

  Future<void> _navigateToAddNew() async {
    final result = await Navigator.pushNamed(context, '/addNew');
    if (result != null && result is Map<String, dynamic>) {
      _addNewDue({
        'title': result['title'],
        'type': result['type'],
        'description': result['description'],
        'dueDate': result['dueDate'],
        'category': _getCategory(result['dueDate']),
      });
    }
  }

  String _getCategory(DateTime dueDate) {
    final now = DateTime.now();
    if (dueDate.isBefore(now)) {
      return 'Overdue';
    } else {
      return 'Upcoming';
    }
  }

  void _openDueListing(String type) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DueListingPage(
          type: type,
          allDeadlines: _allDeadlines,
          onAddNew: _navigateToAddNew,
          onDelete: (item) {
            setState(() {
              _allDeadlines.remove(item);
            });
          },
          onDone: (item) {
            setState(() {
              item['category'] = 'Done';
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DueBuddy'),
      ),
      drawer: AppDrawer(
        username: widget.username,
        allDeadlines: _allDeadlines,
        onAddNew: _navigateToAddNew,
        onDelete: (item) {
          setState(() {
            _allDeadlines.remove(item);
          });
        },
        onDone: (item) {
          setState(() {
            item['category'] = 'Done';
          });
        },
      ),
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
                  ? const Center(child: Text('No due here. 🎉'))
                  : ListView(
                      children: _getFilteredDeadlines()
                        .where((task) {
                          final query = _searchQuery.toLowerCase();
                          return task['title'].toString().toLowerCase().contains(query) ||
                                 task['description'].toString().toLowerCase().contains(query);
                        })
                        .map((task) {
                          return _buildDeadlineCard(
                            task['title'] as String,
                            task['dueIn'] as String,
                            task['category'] as String,
                            task['description'] as String? ?? '',
                            task['type'] as String? ?? '',
                          );
                        }).toList(),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddNew,
        backgroundColor: const Color(0xFF1E88E5),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildDeadlineCard(String title, String dueIn, String category, String description, String type) {
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
        subtitle: Text('Due: $dueIn'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeadlineDetails(
                name: title,
                type: type, // Pass the correct assignment type
                description: description.isNotEmpty ? description : 'No description available',
                deadline: dueIn,
              ),
            ),
          );

          if (result == 'done') {
            setState(() {
              final index = _allDeadlines.indexWhere((task) => task['title'] == title);
              if (index != -1) {
                _allDeadlines[index]['category'] = 'Done';
              }
            });
          } else if (result == 'delete') {
            setState(() {
              _allDeadlines.removeWhere((task) => task['title'] == title);
            });
          }
        },
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredDeadlines() {
    List<Map<String, dynamic>> filtered = selectedCategory == 'All'
        ? _allDeadlines
        : _allDeadlines.where((task) => task['category'] == selectedCategory).toList();

    return filtered.map((task) {
      final DateTime? dueDate = task['dueDate'] as DateTime?;
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
        'type': task['type'] ?? '', 
      };
    }).toList();
  }
}
