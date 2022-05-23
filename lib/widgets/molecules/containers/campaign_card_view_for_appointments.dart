
import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../../screens/main/add_appointment_screen.dart';
import '../../atoms/app_label.dart';

class CampaignCardViewForAppointments extends StatelessWidget {
  final String imgUrl;
  final String vehicleType;
  final String vehicleNo;
  final String serviceType;
  final String time;
  //final String time;

  CampaignCardViewForAppointments({
    Key? key,
    required this.vehicleType,
    required this.imgUrl,
    required this.vehicleNo,
    required this.time,
    required this.serviceType,
    //required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
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
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 9,
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppLabel(text: vehicleType,
                                widgetSize: WidgetSize.large,
                                textColor: Constants.appColorAmberMoreDark,
                                fontWeight: FontWeight.w500,
                              ),

                              SizedBox(height: 5,),

                              AppLabel(text: vehicleNo,
                                widgetSize: WidgetSize.medium,
                                textColor: Constants.appColorAmberDark,
                                fontWeight: FontWeight.w500,
                              ),

                              SizedBox(height: 5,),

                              AppLabel(text: serviceType,
                                widgetSize: WidgetSize.small,
                                textColor: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),

                              SizedBox(height: 5,),

                              AppLabel(text: time,
                                widgetSize: WidgetSize.medium,
                                textColor: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),

                              SizedBox(height: 5,),

                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const AddAppointmentScreen()),
                                      );
                                    },
                                    child: Text('EDIT'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                  ),

                                  SizedBox(width: 30,),

                                  ElevatedButton(
                                    onPressed: (){

                                    },
                                    child: Text('DELETE'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                    ),
                                  ),
                                ],
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

    );
  }
}