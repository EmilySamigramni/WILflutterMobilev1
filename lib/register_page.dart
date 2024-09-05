import 'package:flutter/material.dart';
import 'dart:convert'; // Import for JSON encoding

// Define the Student class
class Student {
  String studentID;
  String firstName;
  String lastName;
  String username;
  String phoneNumber;
  String email;
  String dobYear;
  String dobMonth;
  String dobDay;

  Student({
    required this.studentID,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.dobYear,
    required this.dobMonth,
    required this.dobDay,
  });

  // Method to convert Student object to JSON
  Map<String, dynamic> toJson() {
    return {
      'studentID': studentID,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'dob': '$dobYear-$dobMonth-$dobDay', // Combine year, month, day
    };
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _studentIDController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobYearController = TextEditingController();
  final _dobMonthController = TextEditingController();
  final _dobDayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Green banner color
        title: const Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Register as a Student',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildTextField(_studentIDController, 'Student ID'),
                _buildTextField(_firstNameController, 'First Name'),
                _buildTextField(_lastNameController, 'Last Name'),
                _buildTextField(_usernameController, 'Username'),
                _buildTextField(_phoneNumberController, 'Phone Number', inputType: TextInputType.phone),
                _buildTextField(_emailController, 'Email', inputType: TextInputType.emailAddress),
                _buildTextField(_dobYearController, 'Date of Birth (Year)', inputType: TextInputType.number),
                _buildTextField(_dobMonthController, 'Date of Birth (Month)', inputType: TextInputType.number),
                _buildTextField(_dobDayController, 'Date of Birth (Day)', inputType: TextInputType.number),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _registerStudent,
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to build a TextField widget
  Widget _buildTextField(TextEditingController controller, String label, {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  // Method to handle student registration
  void _registerStudent() {
    final student = Student(
      studentID: _studentIDController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      username: _usernameController.text,
      phoneNumber: _phoneNumberController.text,
      email: _emailController.text,
      dobYear: _dobYearController.text,
      dobMonth: _dobMonthController.text,
      dobDay: _dobDayController.text,
    );

    // Convert the student object to JSON
    String studentJson = jsonEncode(student.toJson());

    // Replace 'print' with 'debugPrint'
    debugPrint("Student JSON: $studentJson");

    // Later, send this JSON to the API
  }
}
