import 'package:flutter/material.dart';
import 'add_new.dart';
import 'deadline_details.dart';

class DueListingPage extends StatelessWidget {
  final String type;
  final List<Map<String, dynamic>> allDeadlines;
  final Future<void> Function() onAddNew;
  final void Function(Map<String, dynamic>) onDelete;
  final void Function(Map<String, dynamic>) onDone;

  const DueListingPage({
    Key? key,
    required this.type,
    required this.allDeadlines,
    required this.onAddNew,
    required this.onDelete,
    required this.onDone,
  }) : super(key: key);

  String _formatDueIn(DateTime? dueDate) {
    if (dueDate == null) return 'No due date';
    final difference = dueDate.difference(DateTime.now());
    if (difference.isNegative) {
      return '${-difference.inDays} day(s) ago';
    } else if (difference.inDays == 0) {
      return 'Today';
    } else {
      return 'in ${difference.inDays} day(s)';
    }
  }

  Widget _buildCategoryIcon(String? category) {
    switch (category) {
      case 'Upcoming':
        return const Icon(Icons.schedule, color: Colors.orange);
      case 'Overdue':
        return const Icon(Icons.warning, color: Colors.red);
      case 'Done':
        return const Icon(Icons.check_circle, color: Colors.green);
      default:
        return const Icon(Icons.assignment, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = allDeadlines
        .where((item) => type == 'All' || item['type'] == type)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$type Due Listing'),
      ),
      
      body: filteredItems.isEmpty
          ? Center(
              child: Text(
                'No $type yet. 🎉',
                style: const TextStyle(fontSize: 16, color: Color(0xFF757575)),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                final dueIn = _formatDueIn(item['dueDate']);
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: _buildCategoryIcon(item['category']),
                    title: Text(
                      item['title'] ?? '',
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
                          item['description'] ?? '',
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
                              'Due: $dueIn',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF757575),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeadlineDetails(
                            name: item['title'] ?? '',
                            type: item['type'] ?? type, // Use the correct assignment type
                            description: item['description'] ?? '',
                            deadline: dueIn,
                          ),
                        ),
                      );
                      if (result == 'delete') {
                        onDelete(item);
                      } else if (result == 'done') {
                        onDone(item);
                      }
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await onAddNew();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
