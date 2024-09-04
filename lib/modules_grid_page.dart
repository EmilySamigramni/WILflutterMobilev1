import 'package:flutter/material.dart';

class MyModulesPage extends StatelessWidget {
  const MyModulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modules Grid'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Module')),
            DataColumn(label: Text('Attendance')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('2024-09-01')),
              DataCell(Text('Module 1')),
              DataCell(Text('Present')),
            ]),
            DataRow(cells: [
              DataCell(Text('2024-09-02')),
              DataCell(Text('Module 2')),
              DataCell(Text('Absent')),
            ]),
            DataRow(cells: [
              DataCell(Text('2024-09-03')),
              DataCell(Text('Module 3')),
              DataCell(Text('Present')),
            ]),
            DataRow(cells: [
              DataCell(Text('2024-09-04')),
              DataCell(Text('Module 4')),
              DataCell(Text('Present')),
            ]),
          ],
        ),
      ),
    );
  }
}
