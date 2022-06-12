import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../const/constants.dart';

class CampaignCardViewForBill extends StatelessWidget {
  //final String vehicle_type;
  //final String vehicle_no;
  final myBill = GetStorage('myBills');
  CampaignCardViewForBill({
    Key? key,
  }) : super(key: key);

  bool checkBillAvailable() {
    print("billing data---------------------->");
    print(myBill.read("vehicleNo"));
    print(myBill.read("total"));
    print(myBill.read("subtotal"));
    var vehicleNo = myBill.read("vehicleNo");
    if (vehicleNo != null) {
      if (vehicleNo.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(14.0),
            color: Constants.appColorAmberLight,
            padding: const EdgeInsets.all(13.0),
            child: checkBillAvailable()
                ? Card(
                    elevation: 9,
                    shadowColor: Constants.appColorAmberDark,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.summarize_outlined, size: 45),
                          title: Text('Appointment Summary & Bill\n'),
                          subtitle:
                              Text('Vehicle No: ${myBill.read("vehicleNo")}\n'),
                        ),
                        //SizedBox(height: ,),
                        ListTile(
                          //leading: Icon(Icons.summarize_outlined, color: Colors.white,size: 45),
                          //title: Text('Appointment Summary'),
                          subtitle: Text(
                            'Payment Details\n',
                            style: TextStyle(
                              color: Constants.appColorAmberMoreDark,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Total = ${myBill.read("total")}\nSubtotal = ${myBill.read("subtotal")}\\n",
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 200,
                    child: Card(
                        elevation: 9,
                        shadowColor: Constants.appColorAmberDark,
                        clipBehavior: Clip.antiAlias,
                        child: Center(
                          child: Text(
                            "No Bills Yet",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
          ),
        ],
      ),
    );
  }
}
