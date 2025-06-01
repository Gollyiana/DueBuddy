import 'package:flutter/material.dart';
import 'deadline_details.dart';

class DeadlineListing extends StatelessWidget {
  final List<Map<String, String>> deadlines;

  const DeadlineListing({super.key, required this.deadlines});

  Color _getDeadlineColor(String days) {
    int daysNum = int.tryParse(days.split(' ')[0]) ?? 0;
    if (daysNum <= 7) return const Color(0xFFD32F2F); // High urgency (Red)
    if (daysNum <= 14)
      return const Color(0xFFF57C00); // Medium urgency (Orange)
    return const Color(0xFF388E3C); // Low urgency (Green)
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: deadlines.length,
      itemBuilder: (context, index) {
        final deadline = deadlines[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              deadline['name'] ?? '',
              style: const TextStyle(color: Color(0xFF212121)),
            ),
            subtitle: Text(
              deadline['days'] ?? '',
              style: const TextStyle(color: Color(0xFF757575)),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xFF757575),
            ),
            leading: Container(
              width: 10,
              height: 40,
              decoration: BoxDecoration(
                color: _getDeadlineColor(deadline['days'] ?? '0 days'),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeadlineDetails(
                    name: deadline['name'] ?? '',
                    type: deadline['type'] ?? 'Unknown',
                    description:
                        deadline['description'] ?? 'No description provided.',
                    deadline: deadline['deadline'] ?? 'Unknown',
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
