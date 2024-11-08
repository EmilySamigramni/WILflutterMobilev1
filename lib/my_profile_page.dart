import 'dart:convert'; // Import for base64 encoding
import 'dart:io'; // Import for File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  File? _image; // Private field to store the selected image

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path); // Set the image file
      });
    }
  }

  // Convert image file to base64 string
  String? _imageToBase64() {
    if (_image != null) {
      List<int> imageBytes = _image!.readAsBytesSync();
      return base64Encode(imageBytes);
    }
    return null;
  }

  // Handle image upload and conversion to JSON
  void _uploadImage() {
    String? base64Image = _imageToBase64();

    if (base64Image != null) {
      Map<String, dynamic> payload = {
        'image': base64Image,
        // Add any other fields you need
      };

      // Convert payload to JSON
      String jsonPayload = jsonEncode(payload);

      // Print the JSON payload for debugging
      debugPrint(jsonPayload);

      // TODO: Implement API call to upload JSON payload
    } else {
      // Handle case where no image is selected
      debugPrint('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sidebar Navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Blue background for the drawer header
              ),
              child: Text(
                'INNOV8',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/myprofile');
              },
            ),
            ListTile(
              title: const Text('Attendance Tracker'),
              onTap: () {
                Navigator.pushNamed(context, '/trackattendance');
              },
            ),
            ListTile(
              title: const Text('My Modules'),
              onTap: () {
                Navigator.pushNamed(context, '/mymodules');
              },
            ),
            ListTile(
              title: const Text('App Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/appsettings');
              },
            ),
            ListTile(
              title: const Text('Back to Home'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.blue, // Blue background for the app bar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.blue, // Blue background for the header
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'My Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: Colors.white, // White background for the main content
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Hey Student!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Black text
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Let\'s review your profile',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: const OutlineInputBorder(),
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: Colors.blue), // Blue label
                    filled: true,
                    fillColor: Colors.grey[200], // Light grey background for input
                  ),
                  style: const TextStyle(color: Colors.black), // Black text
                ),
                const SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.blue), // Blue label
                    filled: true,
                    fillColor: Colors.grey[200], // Light grey background for input
                  ),
                  style: const TextStyle(color: Colors.black), // Black text
                ),
                const SizedBox(height: 16.0),
                _image == null
                    ? const Text(
                        'No image selected.',
                        style: TextStyle(color: Colors.black),
                      )
                    : Image.file(_image!, height: 150, width: 150),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _pickImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Blue button color
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text('Upload Image'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _uploadImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Blue button color
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text('Submit Changes'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
