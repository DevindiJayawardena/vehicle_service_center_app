import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/app_dropdown_menu.dart';
import '../../molecules/containers/drawer.dart';

class AddAppointmentTemplate extends StatefulWidget {
  const AddAppointmentTemplate({Key? key}) : super(key: key);

  @override
  _AddAppointmentTemplateState createState() => _AddAppointmentTemplateState();
}


class _AddAppointmentTemplateState extends State<AddAppointmentTemplate> {
  String selectedVehicle = "";
  String selectedServiceType = "";

  DateTime currentDate = DateTime.now();

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
  }



  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 8, minute: 00),
    TimeOfDay(hour: 9, minute: 00),
  );

  TimeRangeResult? _timeRange;

  @override
  void initState() {
    super.initState();
    _timeRange = _defaultTimeRange;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Appointment"),
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
                locationList: Constants().vehicleList,
                label: "Vehicle",
                hintText: "Select Your Vehicle",
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
                locationList: Constants().serviceTypesList,
                label: "Service Type",
                hintText: "Select",
                onSelected: (serviceType) {
                  selectedServiceType = serviceType;
                  print(selectedServiceType);
                },
              ),
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Appointment Date",
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

            SizedBox(height: 6,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'),
                ),
                Text("                           "),        /* ---------methana display krnna date eka------- */
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

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Pick a Time",
                  style: TextStyle(
                    color: Constants.appColorAmberDark,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "                                   ",
                ),
              ],
            ),

            //SizedBox(height: 6,),

            Padding(
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
                padding: const EdgeInsets.only(top: 8.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Selected Range: ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}',
                      style: TextStyle(
                          fontSize: 16,
                          color: Constants.appColorBlack),
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
              ),


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

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          //side: BorderSide(color: Constants.appColorAmberDark),
                        )
                    ),
                  ),
                  child: Text(
                    "Cancel",
                  ),
                ),

                SizedBox(
                  width: 40,
                ),

                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            //side: BorderSide(color: Constants.appColorAmberDark),
                        )
                    ),
                  ),
                  child: Text(
                    "Confirm",
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
