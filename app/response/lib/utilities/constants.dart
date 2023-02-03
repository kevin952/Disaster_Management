import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

const Color kDarRedColor = Color(0xff902240);
const Color kDarkPinkRedColor = Color(0xffed4c61);
const Color kLightPinkColor = Color(0xfffcc7cd);
const Color kWhiteColour = Colors.white70;

const kBodyStyle = TextStyle(fontSize: 19.0, fontFamily: 'WorkSans-Regular');
const kPageDecoration = PageDecoration(
  titleTextStyle: TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'WorkSans-Black',
  ),
  bodyTextStyle: kBodyStyle,
  descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.symmetric(horizontal: 5.0),
);
const kHelloPageTitleStyle =
    TextStyle(fontFamily: 'Poppins-Bold', color: kWhiteColour);
const kHelloPageBodyStyle =
    TextStyle(fontFamily: 'Poppins-Light', color: kWhiteColour);

const kRegularTextStyle =
    TextStyle(fontFamily: 'ArchivoNarrow-Regular', color: Colors.black87);
