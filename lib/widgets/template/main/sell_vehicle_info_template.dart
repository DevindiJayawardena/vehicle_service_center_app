import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../const/constants.dart';
import '../../molecules/containers/app_dropdown_menu.dart';
import '../../molecules/containers/drawer.dart';

class SellVehicleInfoTemplate extends StatefulWidget {
  const SellVehicleInfoTemplate({Key? key}) : super(key: key);

  @override
  _SellVehicleInfoTemplateState createState() => _SellVehicleInfoTemplateState();
}

class _SellVehicleInfoTemplateState extends State<SellVehicleInfoTemplate> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;


  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if(pickedfiles != null){
        imagefiles = pickedfiles;
        setState(() {
        });
      }else{
        print("No image is selected.");
      }
    }catch (e) {
      print("error while picking file.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sell your Vehicle"),
        backgroundColor: Constants.appColorAmber,
      ),

      drawer: DrawerWidget(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            Center(
              child: Text(
                'Fill the Vehicle Details',
                style: TextStyle(
                  color: Constants.appColorAmberMoreDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
              height: 2,
            ),

            Container(
              width: 950,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AppDropDownMenu(
                locationList: Constants().vehicleTypeList,
                label: "",
                hintText: "Vehicle Type",
                onSelected: (vehicle) {
                  //selectedVehicle = vehicle;
                  //print(selectedVehicle);
                },
              ),
            ),

            SizedBox(height: 17,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Brand",
                  hintText: "Brand",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 17,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Model",
                  hintText: "Model",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 17,),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Manufactured Year",
                  hintText: "Manufactured Year",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),


            SizedBox(height: 1,),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Container(
              width: 950,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AppDropDownMenu(
                locationList: Constants().conditionTypeList,
                label: "",
                hintText: "Condition",
                onSelected: (vehicle) {
                  //selectedVehicle = vehicle;
                  //print(selectedVehicle);
                },
              ),
            ),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Container(
              width: 950,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AppDropDownMenu(
                locationList: Constants().transmissionTypeList,
                label: "",
                hintText: "Transmission",
                onSelected: (vehicle) {
                  //selectedVehicle = vehicle;
                  //print(selectedVehicle);
                },
              ),
            ),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Container(
              width: 950,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AppDropDownMenu(
                locationList: Constants().fuelTypeList,
                label: "",
                hintText: "Fuel Type",
                onSelected: (vehicle) {
                  //selectedVehicle = vehicle;
                  //print(selectedVehicle);
                },
              ),
            ),

            SizedBox(height: 17,),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Engine Capacity",
                  hintText: "Engine Capacity",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 17,),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Mileage",
                  hintText: "Mileage",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 17,),

            //open button ----------------
            ElevatedButton(
              onPressed: (){
                openImages();
                },
              child: Text("Add Photos"),
              style: ElevatedButton.styleFrom(
                primary: Constants.appColorAmberMoreDark,
              ),
            ),

            // Divider(),
            // Text("Picked Images:"),
            // Divider(),

            SizedBox(height: 5,),

            imagefiles != null?Wrap(
              children: imagefiles!.map((imageone){
                return Container(
                    child:Card(
                      child: Container(
                        height: 100,
                        width:100,
                        child: Image.file(File(imageone.path)),
                      ),
                    )
                );
              }).toList(),
            ):Container(),


            SizedBox(height: 20,),


            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Seller Name",
                  hintText: "Seller Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 17,),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "City",
                  hintText: "City",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 17,),


            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Price",
                  hintText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 17,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Contact Number",
                  hintText: "Contact Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 17,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text(
                      'CLEAR',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                  SizedBox(width: 30,),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text(
                      'SAVE & POST',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),


          ],
        ),
      ),
    );
  }
}
