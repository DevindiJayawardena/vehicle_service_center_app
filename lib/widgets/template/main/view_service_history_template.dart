import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/app_dropdown_menu.dart';
import '../../molecules/containers/campaign_card_view_for_service_history.dart';
import '../../molecules/containers/drawer.dart';

class ViewServiceHistoryTemplate extends StatefulWidget {
  const ViewServiceHistoryTemplate({Key? key}) : super(key: key);

  @override
  _ViewServiceHistoryTemplateState createState() => _ViewServiceHistoryTemplateState();
}

class _ViewServiceHistoryTemplateState extends State<ViewServiceHistoryTemplate> {
  String selectedVehicle = "";
  String selectedServiceType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Service History"),
        backgroundColor: Constants.appColorAmber,
      ),

      drawer: DrawerWidget(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),

            Center(
              child: Container(
                width: 360,
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: AppDropDownMenu(
                  locationList: Constants().vehicleList,
                  label: "Vehicle",
                  hintText: "Select Your Vehicle",
                  onSelected: (vehicle) {
                    selectedVehicle = vehicle;
                    print(selectedVehicle);
                  },
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),


            Padding(
              padding: EdgeInsets.all(12),
              child: CampaignCardViewForServiceHistory(
                imgUrl: 'assets/icons/history_removebg.png',
                vehicleNo: 'KJ-4923',
                serviceType: 'Interior Cleaning',
                price: 'Rs. 5000',
                time: '2022-03-24',
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: CampaignCardViewForServiceHistory(
                imgUrl: 'assets/icons/history_removebg.png',
                vehicleNo: 'KJ-4923',
                serviceType: 'Interior Cleaning',
                price: 'Rs. 5000',
                time: '2022-03-24',
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: CampaignCardViewForServiceHistory(
                imgUrl: 'assets/icons/history_removebg.png',
                vehicleNo: 'KJ-4923',
                serviceType: 'Interior Cleaning',
                price: 'Rs. 5000',
                time: '2022-03-24',
              ),
            ),


            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
