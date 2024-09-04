import 'package:flutter/material.dart';

class MyModulesPage extends StatelessWidget {
  const MyModulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Modules'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modulesgrid');
              },
              child: const Text('Module 1'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modulesgrid');
              },
              child: const Text('Module 2'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modulesgrid');
              },
              child: const Text('Module 3'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modulesgrid');
              },
              child: const Text('Module 4'),
            ),
          ],
        ),
      ),
    );
  }
}
