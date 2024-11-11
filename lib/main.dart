//import 'package:find_my_lawyer/pages/CreateAccountPage.dart';
import 'package:find_my_lawyer/pages/LoginPage.dart';
import 'package:find_my_lawyer/pages/home_page.dart';
import 'package:find_my_lawyer/routes.dart';
import 'package:flutter/material.dart';
import 'package:find_my_lawyer/pages/splash_screen.dart';
//import 'package:find_my_lawyer/pages/createaccountpage.dart';  // Import Create Account Page
  // Import MyRoutes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Start with SplashScreen
      routes: {
        '/': (context) => SplashScreen(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
      //  MyRoutes.createAccountRoute: (context) => CreateAccountPage(),
      },
    );
  }
}
