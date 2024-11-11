import 'package:flutter/material.dart';

class LawyerDetailsPage extends StatelessWidget {
  final String name;
  final String category;
  final String location;
  final String lawsuits;
  final String achievements;
  final String experience;
  final String phoneNumber;
  final String email;
  final String imagePath;

  LawyerDetailsPage({
    required this.name,
    required this.category,
    required this.location,
    required this.lawsuits,
    required this.achievements,
    required this.experience,
    required this.phoneNumber,
    required this.email,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.lock_outline_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Picture and Name Section
            Container(
              color: Colors.brown,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(imagePath), // Lawyer's profile picture
                  ),
                  SizedBox(height: 12),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "General Info",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildInfoRow(Icons.location_on, "Location", location),
                  _buildInfoRow(Icons.gavel, "Lawsuits", lawsuits),
                  _buildInfoRow(Icons.stars, "File Achievements", achievements),
                  _buildInfoRow(Icons.timer, "Experience", experience),
                  SizedBox(height: 30),
                  Text(
                    "Contact Me",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildInfoRow(Icons.phone, "Phone Number", phoneNumber),
                  _buildInfoRow(Icons.email, "Mail", email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Widget for info rows
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.brown),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
