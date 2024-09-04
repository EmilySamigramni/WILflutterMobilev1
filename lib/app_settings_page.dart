import 'package:flutter/material.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Notifications'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: const Text('Turn On'),
                            onTap: () {
                              // Handle turning notifications on
                            },
                          ),
                          ListTile(
                            title: const Text('Turn Off'),
                            onTap: () {
                              // Handle turning notifications off
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Notifications'),
            ),
            const SizedBox(height: 40), // Adjust this value for more spacing
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Theme'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: const Text('Light Mode'),
                            onTap: () {
                              // Handle light mode
                            },
                          ),
                          ListTile(
                            title: const Text('Dark Mode'),
                            onTap: () {
                              // Handle dark mode
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
