import 'package:flutter/material.dart';

class DeadlineDetails extends StatelessWidget {
  final String name;
  final String type;
  final String description;
  final String deadline;

  const DeadlineDetails({
    super.key,
    required this.name,
    required this.type,
    required this.description,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deadline Details'),
        backgroundColor: const Color(0xFF1E88E5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Type of assignment: $type',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFBDBDBD)),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[100],
              ),
              child: Text(
                description.trim().isNotEmpty
                    ? description
                    : 'No description available',
                style: const TextStyle(fontSize: 16, color: Color(0xFF757575)),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Deadline: $deadline',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete,
                      color: Color(0xFFD32F2F), size: 32),
                  onPressed: () async {
                    final confirm = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Deadline'),
                        content: const Text(
                            'Are you sure you want to delete this deadline?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true) {
                      Navigator.pop(context, 'delete');
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.check_circle,
                      color: Color(0xFF388E3C), size: 32),
                  onPressed: () {
                    Navigator.pop(context, 'done');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
