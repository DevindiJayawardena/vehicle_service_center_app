import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../molecules/buttons/filled_rounded_button.dart';
import '../../molecules/containers/app_dropdown_menu.dart';
import '../../molecules/containers/campaign_card_view.dart';
import '../../molecules/containers/campaign_card_view_for_vehicle_info.dart';
import '../../molecules/containers/drawer.dart';
import '../../molecules/input_fields/app_input_field.dart';

class ViewVehiclesTemplate extends StatefulWidget {
  const ViewVehiclesTemplate({Key? key}) : super(key: key);

  @override
  _ViewVehiclesTemplateState createState() => _ViewVehiclesTemplateState();
}

class _ViewVehiclesTemplateState extends State<ViewVehiclesTemplate> {
  GlobalKey<FormState> _vehicleTypeKey = GlobalKey<FormState>();

  TextEditingController _vehicleTypeController = TextEditingController();

  GlobalKey<FormState> _vehicleNoKey = GlobalKey<FormState>();

  TextEditingController _vehicleNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View & Add Vehicles"),
        backgroundColor: Constants.appColorAmber,
      ),

      drawer: DrawerWidget(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Your Registered Vehicles",
                style: TextStyle(
                  color: Constants.appColorAmberMoreDark,
                  fontSize: 16,
                ),
              ),
            ),

            SizedBox(
              height: 3,
            ),

            /*-----------------------------------------------------------------------------*/

            Container(
              padding: const EdgeInsets.all(8.0),
              child: CampaignCardViewForVehicleInfo(
                vehicle_type: 'Van',
                vehicle_no: 'KJ-4923',
              ),
            ),

            Container(
              padding: const EdgeInsets.all(8.0),
              child: CampaignCardViewForVehicleInfo(
                vehicle_type: 'Car',
                vehicle_no: '301-9779',
              ),
            ),



            /*-----------------------------------------------------------------------------*/


            SizedBox(
              height: 40,
            ),


            Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              width: 360,
              height: 430,
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                //borderRadius: BorderRadius.all(20),
                color: Constants.appColorAmberMoreLight,
              ),

              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text(
                    'Add A New Vehicle : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Constants.appColorAmberMoreDark,
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    width: 450,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: AppDropDownMenu(
                      locationList: Constants().vehicleTypeList,
                      label: "",
                      hintText: "Select the Vehicle Type",
                      onSelected: (vehicle) {
                        //selectedVehicle = vehicle;
                        //print(selectedVehicle);
                      },
                    ),
                  ),

                  SizedBox(height: 10,),

                  AppInputField(
                      formKey: _vehicleNoKey,
                      controller: _vehicleNoController,
                      inputType: TextInputType.text,
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Vehicle No. is Required"),
                        EmailValidator(errorText: "Enter a Valid Number")
                      ]),
                      iconData: Icons.numbers,
                      color: Constants.appColorAmberMoreDark,
                      hintText: "Vehicle No"
                  ),

                  SizedBox(height: 28,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FilledRoundedButton(
                        text: "Cancel",
                        color: Constants.appColorRed,
                        widgetSize: WidgetSize.maxSize,
                        clickEvent: (){
                          //Get.toNamed(Routes.AD_PACKAGE);
                        }
                    ),
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FilledRoundedButton(
                        text: "Save",
                        color: Constants.appColorAmberDark,
                        widgetSize: WidgetSize.maxSize,
                        clickEvent: (){


                          //Get.toNamed(Routes.AD_PACKAGE);
                        }
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),


          ],
        ),
      ),
    );
  }
}
