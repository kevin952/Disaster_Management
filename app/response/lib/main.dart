import 'package:flutter/material.dart';
import 'package:response/screens/LoginPage.dart';
import 'package:response/screens/OnboardingScreen.dart';
import 'package:flutter/services.dart';
import 'package:response/screens/HelloPage.dart';
import 'package:response/screens/SignUpPage.dart';
import 'screens/HomePage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
//      systemNavigationBarColor: Colors.white,
//      systemNavigationBarDividerColor: Colors.black,
    ),
  );

  runApp(ResponseApp());
}

class ResponseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HelloPage.id,
//      initialRoute: HelloPage.id,
      routes: {
        OnboardingScreen.id: (context) => OnboardingScreen(),
        HelloPage.id: (context) => HelloPage(),
        SignUp.id: (context) => SignUp(),
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
