import 'package:flutter/material.dart';

import '../../widgets/template/auth/forgot_password_template.dart';


class ForgotPasswordScreen extends StatelessWidget {

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordTemplate(
      imgUrl: "assets/images/onboarding-6.png",

    );
  }
}
