import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../../screens/main/sell_vehicle_info_screen.dart';
import '../../atoms/app_label.dart';

class CampaignCardViewForSellingVehicleInfo extends StatelessWidget {
  final String vehicle_type;
  final String vehicle_no;
  final int vehicleId;

  CampaignCardViewForSellingVehicleInfo(
      {Key? key,
      required this.vehicle_type,
      required this.vehicle_no,
      required this.vehicleId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
              elevation: 9,
              shadowColor: Colors.grey,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AppLabel(
                                  text: "Vehicle Type  :  ${vehicle_type}",
                                  widgetSize: WidgetSize.large,
                                  textColor: Constants.appColorBlack,
                                  fontWeight: FontWeight.w500,
                                ),
                                AppLabel(
                                  text: "Vehicle No  :  ${vehicle_no}",
                                  widgetSize: WidgetSize.large,
                                  textColor: Constants.appColorBlack,
                                  fontWeight: FontWeight.w500,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green, // background
                                          onPrimary: Colors.white, // foreground
                                        ),
                                        onPressed: () {
                                          Get.to(() => SellVehicleInfoScreen(),
                                              arguments: [
                                                vehicleId,
                                                vehicle_type
                                              ]);
                                          /*Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SellVehicleInfoScreen()),
                                          );*/
                                        },
                                        child: Text('For Sale'.tr),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
