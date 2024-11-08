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
      title: 'INNOV8 App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Using Blue as the primary color
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'INNOV8 Home Page'),
      // Define the routes
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/myprofile': (context) => const MyProfilePage(),
        '/trackattendance': (context) => const TrackAttendancePage(),
        '/mymodules': (context) => MyModulesPage(),
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
        backgroundColor: Colors.blue.shade200, // Lighter blue for the app bar
        title: const Text('INNOV8'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade900, // Darker blue background for content area
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Profile Icon
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.black, // Black background for profile icon
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white, // White icon for contrast
                    size: 60.0,
                  ),
                ),
                const SizedBox(height: 20),
                // Welcome Text
                const Text(
                  'Welcome to INNOV8!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text to stand out on dark background
                  ),
                ),
                const SizedBox(height: 20),
                // Description Text
                const Text(
                  'Select an option to get started:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Consistent white text for contrast
                  ),
                ),
                const SizedBox(height: 40),
                // Log In Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800, // Darker blue for button background
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.black), // Black text in the button
                  ),
                ),
                const SizedBox(height: 20),
                // Register Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800, // Darker blue for button background
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.black), // Black text in the button
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
