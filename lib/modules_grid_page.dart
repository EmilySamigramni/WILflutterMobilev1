import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Modules',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyModulesPage(),
    );
  }
}

class MyModulesPage extends StatefulWidget {
  @override
  _MyModulesPageState createState() => _MyModulesPageState();
}

class _MyModulesPageState extends State<MyModulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This takes you back to the previous screen
          },
        ),
        title: Text('MY MODULES'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle add module action
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blue[900], // Dark blue background
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              ModuleButton(title: 'PROG'),
              ModuleButton(title: 'OPSC'),
              ModuleButton(title: 'APDS'),
              ModuleButton(title: 'XBCAD'),
            ],
          ),
        ),
      ),
    );
  }
}

class ModuleButton extends StatelessWidget {
  final String title;

  ModuleButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue[700], // White text
          padding: EdgeInsets.symmetric(vertical: 15), // Add padding for better click area
        ),
        onPressed: () {
          // Handle button press for navigating to the corresponding module
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
