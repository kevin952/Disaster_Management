import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:response/models/OnboardingModel.dart';
import 'package:response/screens/HelloPage.dart';
import 'package:response/utilities/constants.dart';

import 'HomePage.dart';

class OnboardingScreen extends StatefulWidget {
  static String id = '/Onboarding2';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final OnboardingPage onboard = OnboardingPage();

  List<PageViewModel> pagesList() {
    List<PageViewModel> list = [];
    for (int i = 0; i < OnboardingPage.getNumOfPages(); i++) {
      list.add(PageViewModel(
        title: onboard.getTitle(i),
        body: onboard.getInfo(i),
        image: Image.asset(onboard.getImage(i)),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: pagesList(),
      onDone: () => Navigator.pushNamed(context, HomePage.id),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text('Skip'),
      next: Icon(Icons.arrow_forward),
      done: Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: kLightPinkColor,
        activeColor: kDarkPinkRedColor,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
