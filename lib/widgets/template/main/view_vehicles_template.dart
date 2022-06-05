import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:vehicle_service_center_app/const/custom_snack_bar.dart';
import 'package:vehicle_service_center_app/controller/profile_controller.dart';
import 'package:vehicle_service_center_app/model/custmer_vehicle.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../molecules/buttons/filled_rounded_button.dart';
import '../../molecules/containers/campaign_card_view_for_vehicle_info.dart';
import '../../molecules/containers/drawer.dart';
import '../../molecules/input_fields/app_input_field.dart';

class ViewVehiclesTemplate extends StatefulWidget {
  final CustomerVehicle customerVehicle;
  ViewVehiclesTemplate({Key? key, required this.customerVehicle})
      : super(key: key);

  @override
  _ViewVehiclesTemplateState createState() => _ViewVehiclesTemplateState();
}

class _ViewVehiclesTemplateState extends State<ViewVehiclesTemplate> {
  GlobalKey<FormState> _vehicleTypeKey = GlobalKey<FormState>();

  TextEditingController _vehicleTypeController = TextEditingController();

  GlobalKey<FormState> _vehicleNoKey = GlobalKey<FormState>();

  TextEditingController _vehicleNoController = TextEditingController();

  ProfileController profileController = Get.put(ProfileController());

  String vehicleType = "";

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
            SizedBox(
              height: 300,
              child: ListView.builder(
                  itemCount: widget.customerVehicle.data?.length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      child: CampaignCardViewForVehicleInfo(
                        vehicle_type:
                            widget.customerVehicle.data![i].vehicleType!,
                        vehicle_no:
                            widget.customerVehicle.data![i].vehicleNumber!,
                      ),
                    );
                  }),
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Add A New Vehicle : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Constants.appColorAmberMoreDark,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /* Container(
                    width: 450,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: AppDropDownMenu(
                      locationList: Constants().vehicleTypeList,
                      label: "",
                      hintText: "Select the Vehicle Type",
                      onSelected: (vehicle) {
                        //selectedVehicle = vehicle;
                        vehicleType = vehicle;
                        //print(selectedVehicle);
                      },
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: DropdownButton<String>(
                      hint: vehicleType.isEmpty
                          ? Text('Vehicle type')
                          : Text(
                              vehicleType,
                              style: TextStyle(
                                  color: Constants.appColorAmberMoreDark),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Constants.appColorAmberMoreDark),
                      items: ['Car', 'Van', 'Jeep', 'Motor Bike, Bus'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            vehicleType = val!;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppInputField(
                      formKey: _vehicleNoKey,
                      controller: _vehicleNoController,
                      inputType: TextInputType.text,
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Vehicle No. is Required"),
                      ]),
                      iconData: Icons.numbers,
                      color: Constants.appColorAmberMoreDark,
                      hintText: "Vehicle No"),
                  SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FilledRoundedButton(
                        text: "Save",
                        color: Constants.appColorAmberDark,
                        widgetSize: WidgetSize.maxSize,
                        clickEvent: () {
                          if (vehicleType.isEmpty) {
                            CustomSnackBar.buildSnackBar(
                                title: "Alert",
                                message: "Please Select a Vehicle Type");
                          } else if (_vehicleNoController.text.isEmpty) {
                            CustomSnackBar.buildSnackBar(
                                title: "Alert",
                                message: "Please Enter your Vehicle Number");
                          } else {
                            profileController.addNewVehicle(
                                vehicleType: vehicleType,
                                vehicleNumber: _vehicleNoController.text);
                          }
                        }),
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
