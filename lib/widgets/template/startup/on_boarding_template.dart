import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../const/constants.dart';
import '../../../screens/main/home_screen.dart';

class OnBoardingTemplate extends StatelessWidget {

  final List<Map<String,String>> items;

  OnBoardingTemplate({
    Key? key,
    required this.items
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages:
          items.map((item) => PageViewModel(
              title: item['title'],
              body: item['body'],
              image: buildImage(item['image']!),
              decoration: getPageDecoration()
          )).toList(),

          done: const Text('START', style: TextStyle(fontWeight: FontWeight.w600,color: Constants.appColorBrownRed )),
          onDone: (){goToHome(context);},
          showSkipButton: true,
          skip: const Text('SKIP',style: TextStyle(color: Constants.appColorBrownRed),),
          onSkip: (){goToHome(context);},
          next: const Text("NEXT",style: TextStyle(color: Constants.appColorBrownRed)),//Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          skipFlex: 0,
          nextFlex: 0,
        ),
      ),
    );

  }
  void goToHome(context){
    print("moved to signup page");
    Constants().setAppInstalledDataInSF(Constants.IS_APP_INSTALLED, true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  Widget buildImage(String path){
    return Center(
      child: Image.asset(
        path,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }

  PageDecoration getPageDecoration(){
    return PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Constants.appColorBlack,
        ),
        bodyTextStyle: TextStyle(
            fontSize: 14,
            color: Constants.appColorBlack
        ),
        descriptionPadding: EdgeInsets.all(0).copyWith(bottom: 0),
        imagePadding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 40),
        pageColor: Colors.transparent,
        imageFlex: 2
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Constants.appColorGray,
    activeColor: Constants.appColorBrownRed,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );
}