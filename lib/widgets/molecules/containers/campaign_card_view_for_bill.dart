
import 'package:flutter/material.dart';

import '../../../const/constants.dart';

class CampaignCardViewForBill extends StatelessWidget {
  //final String vehicle_type;
  //final String vehicle_no;

  CampaignCardViewForBill({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(14.0),
            color: Constants.appColorAmberLight,
            padding: const EdgeInsets.all(13.0),
            child: Card(
              elevation: 9,
              shadowColor: Constants.appColorAmberDark,
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.summarize_outlined, size: 45),
                    title: Text('Appointment Summary & Bill\n'),
                    subtitle: Text('Vehicle No: 301-9772\n'),
                  ),
                  //SizedBox(height: ,),
                  ListTile(
                    //leading: Icon(Icons.summarize_outlined, color: Colors.white,size: 45),
                    //title: Text('Appointment Summary'),
                    subtitle: Text(
                      'Service Types\n',
                      style: TextStyle(
                        color: Constants.appColorAmberMoreDark,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Interior Cleaning = Rs.10000\n\Body Wash = Rs. 1000\n\n\b\b\b\b\b\b\bTOTAL = Rs.11000\n",
                    ),
                  ),
                ],
              ),
            ),
          ),



        ],
      ),


    );
  }
}


