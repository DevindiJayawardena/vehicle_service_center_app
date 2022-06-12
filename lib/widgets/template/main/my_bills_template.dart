import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:vehicle_service_center_app/controller/payment_controller.dart';
import 'package:vehicle_service_center_app/controller/vehicle_sale_controller.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../../screens/main/home_screen.dart';
import '../../molecules/buttons/filled_rounded_button.dart';
import '../../molecules/containers/campaign_card_view_for_bill.dart';
import '../../molecules/containers/drawer.dart';

class MyBillsTemplate extends StatefulWidget {
  const MyBillsTemplate({Key? key}) : super(key: key);

  @override
  _MyBillsTemplateState createState() => _MyBillsTemplateState();
}

class _MyBillsTemplateState extends State<MyBillsTemplate> {
  String rating = "";
  VehicleSaleController vehicleSaleController =
      Get.find<VehicleSaleController>();
  @override
  Widget build(BuildContext context) {
    PaymentController paymentController = Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Bill & Feedback"),
        backgroundColor: Constants.appColorAmber,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            //SizedBox(height: 20,),

            CampaignCardViewForBill(),

            SizedBox(
              height: 25,
            ),

            const Text(
              "Rate the Service",
              style: TextStyle(
                color: Constants.appColorAmberDark,
                fontSize: 20,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            RatingBar.builder(
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rate) {
                rating = rate.toString();
                print("ratings------------------->");
                print(rating);
              },
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FilledRoundedButton(
                  text: "Save",
                  color: Constants.appColorAmberDark,
                  widgetSize: WidgetSize.maxSize,
                  clickEvent: () {
                    //Get.toNamed(Routes.AD_PACKAGE);
                    vehicleSaleController.addRate(rate: rating);
                  }),
            ),

            SizedBox(
              height: 65,
            ),

            const Text(
              "Select Your Payment Method",
              style: TextStyle(
                color: Constants.appColorAmberDark,
                fontSize: 20,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    child: Text(
                      'Cash Payment',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Constants.appColorRed,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      paymentController.makePayment(
                          amount: "5", currency: "USD");
                    },
                    child: Text(
                      'Online Payment',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
