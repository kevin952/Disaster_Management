import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:response/screens/LoginPage.dart';
import 'package:response/utilities/constants.dart';

import 'SignUpPage.dart';

class HelloPage extends StatelessWidget {
  static String id = '/HelloPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarRedColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    kWhiteColour,
                    kLightPinkColor,
                    kDarkPinkRedColor,
                    kDarRedColor
                  ],
                  radius: 0.5,
                  focal: Alignment.center,
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/response_appicon_transparent.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 7,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/signup1.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.38,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Hello,',
                  style: kHelloPageTitleStyle.copyWith(fontSize: 30.0),
                ),
                Text(
                  'This is your first step towards safety!',
                  style: kHelloPageBodyStyle.copyWith(fontSize: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    color: kDarRedColor,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.id);
                    },
                    child: Text(
                      'Sign Up',
                      style: kHelloPageTitleStyle.copyWith(fontSize: 25.0),
                    ),
                  ),
                ),
                Text(
                  'Or',
                  textAlign: TextAlign.center,
                  style: kHelloPageBodyStyle.copyWith(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 15.0),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    color: kDarRedColor,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: Text(
                      'Log In',
                      style: kHelloPageTitleStyle.copyWith(fontSize: 25.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
