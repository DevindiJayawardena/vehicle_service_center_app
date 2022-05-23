import 'package:flutter/material.dart';
import '../../const/constants.dart';
import '../../widgets/template/main/home_template.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      menuBtnData: [

        {
          "title": "Appointments",
          "color": Constants.appColorGray,
          "imgUrl": "assets/images/profile_placeholder.png",
          "clickEvent": (){print("Appointments");}
        },
        {
          "title": "Selling Vehicles",
          "color": Constants.appColorGray,
          "imgUrl": "assets/images/profile_placeholder.png",
          "clickEvent": (){print("Selling Vehicles");}
        },

      ],
    );
  }
}
