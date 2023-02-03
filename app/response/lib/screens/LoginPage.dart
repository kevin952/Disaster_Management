import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:response/screens/HomePage.dart';
import 'package:response/utilities/constants.dart';

import 'HelloPage.dart';

class LoginPage extends StatefulWidget {
  static String id = '/LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
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
//                        errorText: _wrongEmail ? _emailText : null,
                    ),
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
//                        errorText: _wrongPassword ? _passwordText : null,
                    ),
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
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      if (newUser != null) {
                        print('Login Done');
                        Navigator.pushNamed(context, HomePage.id);
                      }
                    },
                    child: Text(
                      'Log In',
                      style: kHelloPageTitleStyle.copyWith(fontSize: 25.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
