import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:response/screens/OnboardingScreen.dart';
import 'package:response/utilities/constants.dart';

class SignUp extends StatefulWidget {
  static String id = '/SignUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
<<<<<<< HEAD
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
=======
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/images/signup2.png'),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/response_appicon_transparent.png',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 13,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Sign',
                  style: kRegularTextStyle.copyWith(
                      color: Colors.black, fontSize: 70),
                ),
                Row(
                  children: [
                    SizedBox(width: 85.0),
                    Text(
                      'Up',
                      style: kRegularTextStyle.copyWith(
                          color: Colors.black, fontSize: 60),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
//                        email = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
>>>>>>> parent of 48e28e3... Merge branch 'dev' of https://github.com/SemAlpha/Disaster_Management into dev
//                        errorText: _wrongEmail ? _emailText : null,
                      ),
                    ),
<<<<<<< HEAD
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
=======
                    SizedBox(height: 20.0),
                    TextField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {
//                        password = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
>>>>>>> parent of 48e28e3... Merge branch 'dev' of https://github.com/SemAlpha/Disaster_Management into dev
//                        errorText: _wrongPassword ? _passwordText : null,
                      ),
                    ),
<<<<<<< HEAD
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    color: Colors.black87,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () async {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      if (newUser != null) {
                        print('user authenticated by registration');
                        Navigator.pushNamed(context, OnboardingScreen.id);
                      }
                    },
                    child: Text(
                      'Sign In',
                      style: kHelloPageTitleStyle.copyWith(fontSize: 25.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
=======
                    SizedBox(height: 10.0),
                  ],
                ),
              ],
            ),
          ),
        ],
>>>>>>> parent of 48e28e3... Merge branch 'dev' of https://github.com/SemAlpha/Disaster_Management into dev
      ),
    );
  }
}
