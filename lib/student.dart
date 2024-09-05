// student.dart
class Student {
  String studentId;
  String firstName;
  String lastName;
  String username;
  String phoneNumber;
  String email;
  String dateOfBirth; // YYYY-MM-DD format

  Student({
    required this.studentId,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth,
  });

  // Convert the Student object to JSON
  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'dateOfBirth': dateOfBirth,
    };
  }
}
