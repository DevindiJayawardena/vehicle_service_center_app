import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../const/base_64_conver.dart';
import '../../../const/constants.dart';
import '../../../model/sale_vehicle.dart';
import '../../molecules/containers/drawer.dart';

class SellingVehicleDetailsTemplate extends StatefulWidget {
  final Data vehicleData;

  SellingVehicleDetailsTemplate({Key? key, required this.vehicleData})
      : super(key: key);

  @override
  _SellingVehicleDetailsTemplateState createState() =>
      _SellingVehicleDetailsTemplateState();
}

class _SellingVehicleDetailsTemplateState
    extends State<SellingVehicleDetailsTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("For Sale"),
        backgroundColor: Constants.appColorAmber,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      '${widget.vehicleData.brand} ${widget.vehicleData.model} ${widget.vehicleData.manufacturedYear}',
                      style: TextStyle(
                        color: Constants.appColorAmberMoreDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.vehicleData.city}',
                        style: TextStyle(
                          color: Constants.appColorAmberMoreDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '${widget.vehicleData.contactNumber}',
                        style: TextStyle(
                          color: Constants.appColorAmberDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: widget.vehicleData.thumbnail == null
                  ? Image.asset("assets/images/placeholder.png")
                  : Image.memory(
                      Base64Convertor.base64StringToBite(
                          widget.vehicleData.thumbnail)!,
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
            ),

            SizedBox(
              height: 10,
            ),

            Center(
              child: Text(
                'Rs. 5,590,000',
                style: TextStyle(
                  color: Constants.appColorAmberMoreDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),

            SizedBox(
              height: 55,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Brand : Honda',
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Model : Civic',
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 14,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Y.O.M : 2007',
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Condition : Used',
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 14,
            ),

            Center(
              child: Text(
                'Transmission : Automation',
              ),
            ),

            SizedBox(
              height: 14,
            ),

            Center(
              child: Text(
                'Fuel Type : Petrol',
              ),
            ),

            SizedBox(
              height: 14,
            ),

            Center(
              child: Text(
                'Engine Capacity : 800 cc',
              ),
            ),

            SizedBox(
              height: 14,
            ),

            Center(
              child: Text(
                'Mileage : 8500 km',
              ),
            ),

            SizedBox(
              height: 24,
            ),

            Center(
              child: Text(
                'Seller Name : Devindi Jayawardena',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('CANCEL'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
