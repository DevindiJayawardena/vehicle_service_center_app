
import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../atoms/app_label.dart';

class CampaignCardViewForServiceHistory extends StatelessWidget {
  final String imgUrl;
  final String vehicleNo;
  final String serviceType;
  final String price;
  final String time;

  CampaignCardViewForServiceHistory({
    Key? key,
    required this.imgUrl,
    required this.vehicleNo,
    required this.price,
    required this.time,
    required this.serviceType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Constants.appColorAmberMoreLight,
          elevation: 9,
          shadowColor: Colors.grey,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical : 20.0),
            child: Container(
              width: double.infinity,
              height: 150,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 20,),
                  Container(
                    child: Image.asset(
                      imgUrl,
                      width: 100,
                      height: 115,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 9,
                    child: Container(
                      color: Colors.white,
                      child: Container(
                        color: Constants.appColorAmberMoreLight,
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            SizedBox(height: 5,),

                            AppLabel(text: vehicleNo,
                              widgetSize: WidgetSize.large,
                              textColor: Constants.appColorAmberDark,
                              fontWeight: FontWeight.w500,
                            ),

                            SizedBox(height: 5,),

                            AppLabel(text: serviceType,
                              widgetSize: WidgetSize.large,
                              textColor: Constants.appColorAmberMoreDark,
                              fontWeight: FontWeight.w700,
                            ),

                            SizedBox(height: 5,),

                            AppLabel(text: price,
                              widgetSize: WidgetSize.medium,
                              textColor: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),

                            SizedBox(height: 5,),

                            AppLabel(text: time,
                              widgetSize: WidgetSize.medium,
                              textColor: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),

                            SizedBox(height: 5,),

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

    );
  }
}