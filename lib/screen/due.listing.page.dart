import 'package:flutter/material.dart';
import 'add_new.dart';
import 'deadline_details.dart';

class DueListingPage extends StatefulWidget {
  final String type;

  const DueListingPage({super.key, required this.type});

  @override
  State<DueListingPage> createState() => _DueListingPageState();
}

class _DueListingPageState extends State<DueListingPage> {
  List<Map<String, dynamic>> dueItems = [];

  @override
  void initState() {
    super.initState();
    // Start with some sample data
    dueItems = [
      {
        'name': '${widget.type} Homework 1',
        'description': 'Complete chapter 1 exercises.',
        'deadline': '2025-06-15',
      },
      {
        'name': '${widget.type} Homework 2',
        'description': 'Submit final draft of essay.',
        'deadline': '2025-06-20',
      },
    ];
  }

  Future<void> _navigateToAddNew() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewPage(),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        dueItems.add({
          'name': result['title'],
          'description': result['description'],
          'deadline': '${result['dueDate'].day}/${result['dueDate'].month}/${result['dueDate'].year}',
          'type': result['type'],
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Due Listing'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _navigateToAddNew,
          ),
        ],
      ),
      body: dueItems.isEmpty
          ? Center(
              child: Text(
                'No ${widget.type} due items yet.',
                style: const TextStyle(fontSize: 16, color: Color(0xFF757575)),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: dueItems.length,
              itemBuilder: (context, index) {
                final item = dueItems[index];
                return Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      item['name']?.toString() ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          item['description']?.toString() ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF757575),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                size: 16, color: Color(0xFF757575)),
                            const SizedBox(width: 4),
                            Text(
                              'Due: ${item['deadline']?.toString() ?? ''}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF757575),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeadlineDetails(
                            name: item['name'] ?? '',
                            type: item['type'] ?? widget.type,
                            description: item['description'] ?? '',
                            deadline: item['deadline'] ?? '',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddNew,
        child: const Icon(Icons.add),
      ),
    );
  }
}
