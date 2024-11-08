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
            Navigator.pop(context);
          },
        ),
        title: Text('MY MODULES'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Implement add module functionality if needed
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blue[900], // Darker blue background
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            ModuleButton(title: 'PROG'),
            ModuleButton(title: 'OPSC'),
            ModuleButton(title: 'APDS'),
            ModuleButton(title: 'XBCAD'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation for bottom bar
        },
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
      child: ElevatedButton(
        onPressed: () {
          // Handle module selection
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade800, // Darker blue button background
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: TextStyle(fontSize: 18),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.black), // Black text for the button
        ),
      ),
    );
  }
}
