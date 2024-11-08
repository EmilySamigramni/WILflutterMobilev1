import 'package:flutter/material.dart';
import 'student.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController(); // YYYY-MM-DD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Color(0xFF1B2342), // Dark blue AppBar
      ),
      backgroundColor: Color(0xFF283457), // Background color set to a custom dark blue
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Circle Avatar with Icon
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                
                // Welcome Text
                const Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color to white for contrast
                  ),
                ),
                const SizedBox(height: 10.0),
                
                // Register Text
                const Text(
                  'REGISTER HERE',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const SizedBox(height: 30.0),

                // Student ID Field
                _buildTextField(_studentIdController, 'Student ID'),
                const SizedBox(height: 15.0),

                // First Name Field
                _buildTextField(_firstNameController, 'First Name'),
                const SizedBox(height: 15.0),

                // Last Name Field
                _buildTextField(_lastNameController, 'Last Name'),
                const SizedBox(height: 15.0),

                // Username Field
                _buildTextField(_usernameController, 'Username'),
                const SizedBox(height: 15.0),

                // Phone Number Field
                _buildTextField(_phoneNumberController, 'Phone Number', isPhone: true),
                const SizedBox(height: 15.0),

                // Email Field
                _buildTextField(_emailController, 'Email', isEmail: true),
                const SizedBox(height: 15.0),

                // Date of Birth Field
                _buildTextField(_dobController, 'Date of Birth', hintText: 'YYYY-MM-DD'),
                const SizedBox(height: 30.0),

                // Register Button
                ElevatedButton(
                  onPressed: _registerStudent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom text field builder
  Widget _buildTextField(TextEditingController controller, String label, {bool isPhone = false, bool isEmail = false, String? hintText}) {
    return TextField(
      controller: controller,
      keyboardType: isPhone ? TextInputType.phone : (isEmail ? TextInputType.emailAddress : TextInputType.text),
      decoration: InputDecoration(
        hintText: hintText ?? label,
        hintStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: const Color(0xFFEEEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Register student function
  void _registerStudent() {
    Student student = Student(
      studentId: _studentIdController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      username: _usernameController.text,
      phoneNumber: _phoneNumberController.text,
      email: _emailController.text,
      dateOfBirth: _dobController.text,
    );

    Map<String, dynamic> studentJson = student.toJson();

    debugPrint(studentJson.toString());
  }
}
