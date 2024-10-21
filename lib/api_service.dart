import 'dart:convert';
import 'package:http/http.dart' as http;
import 'student.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  // Method to register a student
  Future<http.Response> registerStudent(Student student) async {
    final url = Uri.parse('https://faceon-api.calmwave-03f9df68.southafricanorth.azurecontainerapps.io/Student/Post'); // Adjust the endpoint accordingly

    final Map<String, dynamic> body = {
      'studentId': student.studentId,
      'firstName': student.firstName,
      'lastName': student.lastName,
      'username': student.username,
      'phoneNumber': student.phoneNumber,
      'email': student.email,
      'dateOfBirth': student.dateOfBirth,
      'campusId': student.campusId,
      'registrationComplete': student.registrationComplete,
    };


  print('JSON Body: ${jsonEncode(body)}');

  // Send the HTTP POST request
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(body),
  );

    return response;
  }
  

  // Method to upload profile data
  Future<http.Response> uploadProfileData(Student student) async {
    final url = Uri.https('$baseUrl/Student/Post'); // Adjust the endpoint accordingly
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'studentId': student.studentId,
        'firstName': student.firstName,
        'lastName': student.lastName,
        'username': student.username,
        'phoneNumber': student.phoneNumber,
        'email': student.email,
        'dateOfBirth': student.dateOfBirth,
        'campusId': student.campusId,
        'registrationComplete': student.registrationComplete,
      }),
    );

    return response;
  }
}
