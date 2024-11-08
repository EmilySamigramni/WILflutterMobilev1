import 'package:flutter/material.dart';

class TrackAttendancePage extends StatelessWidget {
  const TrackAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Attendance'),
        backgroundColor: Colors.blue, // Set AppBar background to blue
      ),
      body: Container(
        color: Colors.blue[50], // Light blue background for the body
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Attendance Summary Title
            const Text(
              'Attendance Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Title text color to match theme
              ),
            ),
            const SizedBox(height: 16.0),

            // Row with buttons (Day, Week, Month)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Day button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Day'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Week button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Week'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Month button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Month'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Attendance Table
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Number of Days',
                        style: TextStyle(fontWeight: FontWeight.bold),
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
