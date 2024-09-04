import 'package:flutter/material.dart';

class TrackAttendancePage extends StatelessWidget {
  const TrackAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Attendance'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Attendance Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(150.0),
                1: FlexColumnWidth(),
              },
              children: const <TableRow>[
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Status',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Number of Days',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Attended'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('20'), // Example data
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Absent'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('5'), // Example data
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Left Early'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('3'), // Example data
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
