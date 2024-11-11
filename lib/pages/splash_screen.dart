import 'package:find_my_lawyer/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'LoginPage.dart'; // Import the LoginPage

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/lawyer_logo.jpeg'),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to My Lawyer App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
