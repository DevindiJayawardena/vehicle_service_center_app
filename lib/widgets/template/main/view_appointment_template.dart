import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/campaign_card_view_for_appointments.dart';
import '../../molecules/containers/drawer.dart';

class ViewAppointmentTemplate extends StatelessWidget {
  const ViewAppointmentTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.appColorAmber,
        elevation: 0,
        title: Text("Your Appointments"),
        // leading: IconButton(
        //     onPressed: () {
        //       print("notification");
        //     },
        //     icon: Icon(
        //       Icons.view_headline,
        //       color: Constants.appColorAmber,
        //     )),
        // actions: [],
      ),

      drawer: DrawerWidget(),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  print("printed gesture detecture");
                },
                child: CampaignCardViewForAppointments(
                  vehicleType: "Toyota Vitz 2015",
                  imgUrl: "assets/images/appointment_two.png",
                  vehicleNo: "DP-1997",
                  serviceType: "Interior Cleaning",
                  //distance: "85000km",
                  time: "2022/03/02",
                ),
              ),
            ),



            Container(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  print("printed gesture detecture");
                },
                child: CampaignCardViewForAppointments(
                  vehicleType: "Toyota Vitz 2015",
                  imgUrl: "assets/images/appointment_two.png",
                  vehicleNo: "DP-1997",
                  serviceType: "Interior Cleaning",
                  time: "2022/03/02",
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

}


