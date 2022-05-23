import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../../screens/main/home_screen.dart';
import '../../../screens/main/payment_details_screeen.dart';
import '../../molecules/buttons/filled_rounded_button.dart';
import '../../molecules/containers/campaign_card_view_for_bill.dart';
import '../../molecules/containers/drawer.dart';

class MyBillsTemplate extends StatefulWidget {
  const MyBillsTemplate({Key? key}) : super(key: key);

  @override
  _MyBillsTemplateState createState() => _MyBillsTemplateState();
}

class _MyBillsTemplateState extends State<MyBillsTemplate> {
  @override
  Widget build(BuildContext context) {
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
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
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
                  clickEvent: (){
                    //Get.toNamed(Routes.AD_PACKAGE);
                  }
              ),
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


            SizedBox(height: 10,),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    },
                    child: Text(
                      'Cash Payment',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Constants.appColorRed,
                    ),
                  ),

                  SizedBox(width: 30,),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PaymentDetailsScreen()),
                      );
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
