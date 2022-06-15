import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:vehicle_service_center_app/const/custom_snack_bar.dart';
import 'package:vehicle_service_center_app/controller/appoinment_controller.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/app_dropdown_menu.dart';
import '../../molecules/containers/drawer.dart';

class AddAppointmentTemplate extends StatefulWidget {
  bool isEdit;
  String? appointmentId;
  AddAppointmentTemplate({Key? key, required this.isEdit, this.appointmentId})
      : super(key: key);

  @override
  _AddAppointmentTemplateState createState() => _AddAppointmentTemplateState();
}

class _AddAppointmentTemplateState extends State<AddAppointmentTemplate> {
  String selectedVehicle = "";
  String selectedServiceType = "";
  String selectedTimeSlot = "";
  AppointmentController appointmentController =
      Get.find<AppointmentController>();
  DateTime currentDate = DateTime.now();
  String selectedTime = "";

  final userBox = GetStorage('userBox');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2017),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    final df = new DateFormat('yyyy-MM-dd');
    selectedTime = df.format(currentDate);
  }

  /*final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 8, minute: 00),
    TimeOfDay(hour: 9, minute: 00),
  );

  TimeRangeResult? _timeRange;*/

  @override
  void initState() {
    super.initState();
    //_timeRange = _defaultTimeRange;
  }

  @override
  Widget build(BuildContext context) {
    var token = userBox.read('token');
    var userId = userBox.read('id');

    List<dynamic> vehicleMap = [];
    appointmentController.vehicles.data?.forEach((element) {
      vehicleMap.add({'id': element.id, 'label': element.vehicleNumber});
    });

    List<dynamic> upgradeTypeMap = [];
    appointmentController.upgradeTypes.data?.forEach((element) {
      upgradeTypeMap.add({'id': element.id, 'label': element.name});
    });

    List<dynamic> timeSlotMap = [];
    appointmentController.timeSlot.data?.forEach((element) {
      timeSlotMap.add(
          {'id': element.id, 'label': '${element.start} - ${element.end}'});
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("ADD AN APPOINTMENT".tr),
        backgroundColor: Constants.appColorAmber,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 360,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: AppDropDownMenu(
                locationList: vehicleMap,
                label: "Vehicle".tr,
                hintText: "Select Your Vehicle".tr,
                onSelected: (vehicle) {
                  selectedVehicle = vehicle;
                  print(selectedVehicle);
                },
              ),
            ),

            SizedBox(height: 20),

            Container(
              width: 360,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: AppDropDownMenu(
                locationList: upgradeTypeMap,
                label: "Service Type".tr,
                hintText: "Select".tr,
                onSelected: (serviceType) {
                  selectedServiceType = serviceType;
                  print(selectedServiceType);
                },
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Appointment Date".tr,
                  style: TextStyle(
                    color: Constants.appColorAmberDark,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "                        ",
                ),
              ],
            ),

            SizedBox(
              height: 6,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'.tr),
                ),
                Text(selectedTime),
              ],
            ),

            // Container(
            //   width: 360,
            //   padding: EdgeInsets.symmetric(horizontal: 50),
            //   child: AppDropDownMenu(
            //     locationList: Constants().vehicleList,
            //     label: "Appointment Date",
            //     hintText: "Select",
            //     onSelected: (){},
            //     // onSelected: (vehicle) {
            //     //   selectedVehicle = vehicle;
            //     //   print(selectedVehicle);
            //     // },
            //   ),
            // ),

            SizedBox(
              height: 20,
            ),

            //SizedBox(height: 6,),
            Container(
              width: 360,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: AppDropDownMenu(
                locationList: timeSlotMap,
                label: "Time Slot".tr,
                hintText: "Select".tr,
                onSelected: (serviceType) {
                  selectedTimeSlot = serviceType;
                },
              ),
            ),

            /*Padding(
              padding: const EdgeInsets.all(15.0),
              child: TimeRange(
                fromTitle: Text(
                  'FROM',
                  style: TextStyle(
                    fontSize: 14,
                    color: Constants.appColorBlack.withOpacity(0.4),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                toTitle: Text(
                  'TO',
                  style: TextStyle(
                    fontSize: 14,
                    color: Constants.appColorBlack.withOpacity(0.4),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                //titlePadding: leftPadding,
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Constants.appColorBlack,
                ),
                activeTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Constants.appColorBlack,
                ),
                borderColor: Constants.appColorAmber,
                activeBorderColor: Constants.appColorBlack,
                backgroundColor: Colors.transparent,
                activeBackgroundColor: Constants.appColorAmber,
                firstTime: TimeOfDay(hour: 8, minute: 00),
                lastTime: TimeOfDay(hour: 18, minute: 00),
                initialRange: _timeRange,
                timeStep: 60,
                timeBlock: 60,
                onRangeCompleted: (range) => setState(() => _timeRange = range),
              ),
            ),

            //SizedBox(height: 15,),

            if (_timeRange != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Selected Range: ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}',
                      style: TextStyle(
                          fontSize: 16, color: Constants.appColorBlack),
                    ),
                    SizedBox(height: 15),
                    MaterialButton(
                      child: Text('Set Default Time period'),
                      onPressed: () =>
                          setState(() => _timeRange = _defaultTimeRange),
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),*/

            // Container(
            //   width: 360,
            //   padding: EdgeInsets.symmetric(horizontal: 50),
            //   child: AppDropDownMenu(
            //     locationList: Constants().vehicleList,
            //     label: "Pick a Time",
            //     hintText: "Select",
            //     onSelected: (vehicle) {
            //       selectedVehicle = vehicle;
            //       print(selectedVehicle);
            //     },
            //   ),
            // ),

            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      //side: BorderSide(color: Constants.appColorAmberDark),
                    )),
                  ),
                  child: Text(
                    "Cancel".tr,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (widget.isEdit) {
                      if (selectedVehicle.isNotEmpty &&
                          selectedServiceType.isNotEmpty &&
                          selectedTimeSlot.isNotEmpty &&
                          selectedTime.isNotEmpty) {
                        appointmentController.updateAppointment(
                            token,
                            widget.appointmentId!,
                            selectedVehicle,
                            selectedServiceType,
                            selectedTimeSlot,
                            selectedTime);
                      } else {
                        CustomSnackBar.buildSnackBar(
                            title: "Alert".tr,
                            message: "Please Fill out All Fields".tr);
                      }
                    } else {
                      if (selectedVehicle.isNotEmpty &&
                          selectedServiceType.isNotEmpty &&
                          selectedTimeSlot.isNotEmpty &&
                          selectedTime.isNotEmpty) {
                        appointmentController.createAppointment(
                            token,
                            selectedVehicle,
                            selectedServiceType,
                            selectedTimeSlot,
                            selectedTime);
                      } else {
                        CustomSnackBar.buildSnackBar(
                            title: "Alert".tr,
                            message: "Please Fill out All Fields".tr);
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      //side: BorderSide(color: Constants.appColorAmberDark),
                    )),
                  ),
                  child: Text(
                    widget.isEdit ? "Update".tr : "Confirm".tr,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
