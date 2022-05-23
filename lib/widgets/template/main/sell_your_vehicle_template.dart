import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/campaign_card_view_for_selling_vehicle_info.dart';
import '../../molecules/containers/campaign_card_view_for_vehicle_info.dart';
import '../../molecules/containers/drawer.dart';

class SellYourVehicleTemplate extends StatefulWidget {
  const SellYourVehicleTemplate({Key? key}) : super(key: key);

  @override
  _SellYourVehicleTemplateState createState() => _SellYourVehicleTemplateState();
}

class _SellYourVehicleTemplateState extends State<SellYourVehicleTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Vehicles"),
        backgroundColor: Constants.appColorAmber,
      ),

      drawer: DrawerWidget(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Your Registered Vehicles",
                style: TextStyle(
                  color: Constants.appColorAmberMoreDark,
                  fontSize: 16,
                ),
              ),
            ),

            SizedBox(
              height: 3,
            ),

            /*-----------------------------------------------------------------------------*/

            Container(
              padding: const EdgeInsets.all(8.0),
              child: CampaignCardViewForSellingVehicleInfo(
                vehicle_type: 'Van',
                vehicle_no: 'KJ-4923',
              ),
            ),

            Container(
              padding: const EdgeInsets.all(8.0),
              child: CampaignCardViewForSellingVehicleInfo(
                vehicle_type: 'Car',
                vehicle_no: '301-9779',
              ),
            ),

            /*-----------------------------------------------------------------------------*/


          ],
        ),
      ),

    );
  }
}
