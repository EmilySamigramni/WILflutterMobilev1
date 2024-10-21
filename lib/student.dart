class Student {
  final String studentId;
  final String firstName;
  final String lastName;
  final String username;
  final String phoneNumber;
  final String email;
  final String dateOfBirth;
  final int campusId;
  final bool registrationComplete;

  Student({
    required this.studentId,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth,
    required this.campusId,
    required this.registrationComplete,
  });

  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'dateOfBirth': dateOfBirth, // Convert DateTime to String
      'campusId': campusId,
      'registrationComplete': registrationComplete,
    };
  }
}
