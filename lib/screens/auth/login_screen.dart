import 'package:flutter/material.dart';

import '../../widgets/template/auth/login_template.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      imgUrl: "assets/images/onboarding-5.png",
      btnText: "Login",
      heading: "Login",
    );
  }
}



