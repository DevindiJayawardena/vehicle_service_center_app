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
    print(myBill.read("serviceId"));
    print(myBill.read("total"));
    print(myBill.read("subtotal"));
    var serviceId = myBill.read("serviceId");
    if (serviceId != null) {
      if (serviceId.isNotEmpty) {
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("${myBill.read("date")}",
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                  "${myBill.read("fName")} ${myBill.read("lName")}",
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "NIC",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("${myBill.read("nic")}",
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("${myBill.read("email")}",
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Vehicle No",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("${myBill.read("vehicleNumber")}",
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Service Type",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("${myBill.read("upgradeType")}",
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("${myBill.read("discount")}%",
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("${myBill.read("subtotal")}\$",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("${myBill.read("total")}\$",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
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
