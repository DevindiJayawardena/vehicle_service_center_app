
import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../atoms/app_label.dart';

class CampaignCardViewForVehicleInfo extends StatelessWidget {
  final String vehicle_type;
  final String vehicle_no;

  CampaignCardViewForVehicleInfo({
    Key? key,
    required this.vehicle_type,
    required this.vehicle_no,
  }) : super(key: key);

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
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical : 8.0),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),

        ],
      ),


    );
  }
}