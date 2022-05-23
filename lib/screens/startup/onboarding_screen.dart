import 'package:flutter/material.dart';

import '../../widgets/template/startup/on_boarding_template.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingTemplate(
      items: [
        {
          "image":"assets/images/onboarding_image-1.png",
          "title": "Interim Service",
          "body": "Get the Interim Service checks for the levels of fluids of your vehicle",
        },
        {
          "image":"assets/images/onboarding_image-2.png",
          "title": "Full Service",
          "body": "Get the Full Service for all interesting points of your vehicle",
        },
        {
          "image":"assets/images/onboarding_image-2.png",
          "title": "Oil Change",
          "body": "Get an oil change for a longer Engine life",
        },
        {
          "image":"assets/images/onboarding_image-3.png",
          "title": "Easy to maintain Servicing Schedules",
          "body": "Maintain your Servicing appointments & Upgrade types via app, & use more attractive facilities",
        },
        {
          "image":"assets/images/onboarding_image-2.png",
          "title": "Payment Options",
          "body": "Easy to select payment options according to your preference",
        },
        {
          "image":"assets/images/onboarding_image-4.png",
          "title": "Be Connected with our Services",
          "body": "Get in touch with our Vehicle Services & get notifications, requests as well",
        },
      ],
    );
  }
}
