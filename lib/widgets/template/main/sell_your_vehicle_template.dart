import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_service_center_app/model/custmer_vehicle.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/campaign_card_view_for_selling_vehicle_info.dart';
import '../../molecules/containers/drawer.dart';

class SellYourVehicleTemplate extends StatefulWidget {
  final CustomerVehicle customerVehicle;
  SellYourVehicleTemplate({Key? key, required this.customerVehicle})
      : super(key: key);

  @override
  _SellYourVehicleTemplateState createState() =>
      _SellYourVehicleTemplateState();
}

class _SellYourVehicleTemplateState extends State<SellYourVehicleTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Vehicles".tr),
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
                "Your Registered Vehicles".tr,
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
            SizedBox(
              height: 700,
              child: ListView.builder(
                  itemCount: widget.customerVehicle.data?.length,
                  itemBuilder: (ctx, i) => Container(
                        padding: const EdgeInsets.all(8.0),
                        child: CampaignCardViewForSellingVehicleInfo(
                          vehicle_type:
                              widget.customerVehicle.data![i].vehicleType!,
                          vehicle_no:
                              widget.customerVehicle.data![i].vehicleNumber!,
                          vehicleId: widget.customerVehicle.data![i].id!,
                        ),
                      )),
            ),

            /*-----------------------------------------------------------------------------*/
          ],
        ),
      ),
    );
  }
}
