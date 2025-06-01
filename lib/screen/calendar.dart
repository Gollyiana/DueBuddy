import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Monday 26 May 2025',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 20),
            Table(
              border: TableBorder.all(color: Colors.grey.shade300),
              children: const [
                TableRow(
                  decoration: BoxDecoration(
                    color: Color(0xFF1E88E5),
                  ),
                  children: [
                    Center(
                        child:
                            Text('Su', style: TextStyle(color: Colors.white))),
                    Center(
                        child:
                            Text('Mo', style: TextStyle(color: Colors.white))),
                    Center(
                        child:
                            Text('Tu', style: TextStyle(color: Colors.white))),
                    Center(
                        child:
                            Text('We', style: TextStyle(color: Colors.white))),
                    Center(
                        child:
                            Text('Th', style: TextStyle(color: Colors.white))),
                    Center(
                        child:
                            Text('Fr', style: TextStyle(color: Colors.white))),
                    Center(
                        child:
                            Text('Sa', style: TextStyle(color: Colors.white))),
                  ],
                ),
                TableRow(
                  children: [
                    Center(
                        child: Text('1',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('2',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('3',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('4',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('5',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('6',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('7',
                            style: TextStyle(color: Color(0xFF212121)))),
                  ],
                ),
                TableRow(
                  children: [
                    Center(
                        child: Text('8',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('9',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('10',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('11',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('12',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('13',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('14',
                            style: TextStyle(color: Color(0xFF212121)))),
                  ],
                ),
                TableRow(
                  children: [
                    Center(
                        child: Text('15',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('16',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('17',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('18',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('19',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('20',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('21',
                            style: TextStyle(color: Color(0xFF212121)))),
                  ],
                ),
                TableRow(
                  children: [
                    Center(
                        child: Text('22',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('23',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('24',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('25',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('26',
                            style: TextStyle(
                                color: Color(0xFF1E88E5),
                                fontWeight: FontWeight.bold))),
                    Center(
                        child: Text('27',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('28',
                            style: TextStyle(color: Color(0xFF212121)))),
                  ],
                ),
                TableRow(
                  children: [
                    Center(
                        child: Text('29',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('30',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(
                        child: Text('31',
                            style: TextStyle(color: Color(0xFF212121)))),
                    Center(child: Text('')),
                    Center(child: Text('')),
                    Center(child: Text('')),
                    Center(child: Text('')),
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E88E5),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
