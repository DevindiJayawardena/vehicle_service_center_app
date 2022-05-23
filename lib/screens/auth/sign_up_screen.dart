import 'package:flutter/material.dart';

import '../../widgets/template/auth/signup_template.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignUpTemplate(
      imgUrl: "assets/images/onboarding-5.png",
      btnText: "Sign Up",
      heading: "Sign Up",
    );

  }
}
