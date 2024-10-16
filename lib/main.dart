import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the login page
import 'register_page.dart'; // Import the register page
import 'my_profile_page.dart'; // Import the my profile page
import 'track_attendance_page.dart'; // Import the track attendance page
import 'modules_grid_page.dart'; // Import the modules grid page
import 'app_settings_page.dart'; // Import the app settings page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // Define the routes
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/myprofile': (context) => const MyProfilePage(),
        '/trackattendance': (context) => const TrackAttendancePage(),
        '/mymodules': (context) => const MyModulesPage(),
        '/appsettings': (context) => const AppSettingsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('INNOV8'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Log In'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
