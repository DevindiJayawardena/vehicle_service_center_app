import 'package:flutter/material.dart';

import '../../widgets/template/main/contact_us_template.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContactUsTemplate(
      imgUrl: "assets/icons/logo.png",
    );
  }
}
