import 'package:flutter/material.dart';
import 'api_service.dart';
import 'student.dart'; 

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final ApiService apiService = ApiService('https://faceon-api.calmwave-03f9df68.southafricanorth.azurecontainerapps.io/Student/Post');
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController(); // YYYY-MM-DD
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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
                _buildTextField(_studentIdController, 'Student ID'),
                const SizedBox(height: 10),
                _buildTextField(_firstNameController, 'First Name'),
                const SizedBox(height: 10),
                _buildTextField(_lastNameController, 'Last Name'),
                const SizedBox(height: 10),
                _buildTextField(_usernameController, 'Username'),
                const SizedBox(height: 10),
                _buildTextField(_phoneNumberController, 'Phone Number', TextInputType.phone),
                const SizedBox(height: 10),
                _buildTextField(_emailController, 'Email', TextInputType.emailAddress),
                const SizedBox(height: 10),
                _buildTextField(_dobController, 'Date of Birth', TextInputType.datetime, 'YYYY-MM-DD'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _registerStudent,
                  child: _isLoading 
                    ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)) 
                    : const Text('Register'),
                
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, [TextInputType? inputType, String? hintText]) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }

  void _registerStudent() {
    // Basic validation to check if fields are filled
    if (_studentIdController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _dobController.text.isEmpty) {
      // Show an error message if validation fails
      _showErrorMessage("Please fill in all fields.");
      return;
    }

    setState(() {
      _isLoading = true; // Start loading
    });

    int hardcodedCampusId = 1; // Example campus ID
    bool hardcodedRegistrationComplete = true; // Example boolean value

    // Convert the string date to DateTime using the custom method
    convertToDateTime(_dobController.text);

    Student student = Student(
      studentId: _studentIdController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      username: _usernameController.text,
      phoneNumber: _phoneNumberController.text,
      email: _emailController.text,
      dateOfBirth: _dobController.text,  // Pass DateTime object
      campusId: hardcodedCampusId,
      registrationComplete: hardcodedRegistrationComplete,
    );

    apiService.registerStudent(student).then((response) {
      setState(() {
        _isLoading = false; // Stop loading
      });

      if (response.statusCode == 200) {
        // Successfully registered
        debugPrint('Student registered successfully!');
        debugPrint('Response data: ${response.body}');
        _showSuccessMessage("Registration successful!");
      } else {
        // Failed to register the student
        debugPrint('Registration failed: ${response.body}');
        _showErrorMessage("Registration failed: ${response.body}");
      }
    }).catchError((error) {
      setState(() {
        _isLoading = false; // Stop loading
      });
      // Handle any errors
      debugPrint('Error occurred: $error');
      _showErrorMessage("Error occurred: $error");
    });
  }

  DateTime convertToDateTime(String dateStr) {
    // Example: '2024-09-06' -> DateTime(2024, 9, 6)
    final parts = dateStr.split('-');
    return DateTime(
      int.parse(parts[0]), // Year
      int.parse(parts[1]), // Month
      int.parse(parts[2]), // Day
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}
