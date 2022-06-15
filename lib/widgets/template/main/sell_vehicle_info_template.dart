import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_service_center_app/const/custom_snack_bar.dart';
import 'package:vehicle_service_center_app/controller/vehicle_sale_controller.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/app_dropdown_menu.dart';
import '../../molecules/containers/drawer.dart';

class SellVehicleInfoTemplate extends StatefulWidget {
  final int vehicleId;
  final String vehicleType;

  SellVehicleInfoTemplate(
      {Key? key, required this.vehicleId, required this.vehicleType})
      : super(key: key);

  @override
  _SellVehicleInfoTemplateState createState() =>
      _SellVehicleInfoTemplateState();
}

class _SellVehicleInfoTemplateState extends State<SellVehicleInfoTemplate> {
  final ImagePicker imgpicker = ImagePicker();
  VehicleSaleController vehicleSaleController =
      Get.find<VehicleSaleController>();
  List<XFile> imagefiles = [];
  TextEditingController typeController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController manufacYearController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  TextEditingController transmissionController = TextEditingController();
  TextEditingController fuelTypeController = TextEditingController();
  TextEditingController engineCapacityController = TextEditingController();
  TextEditingController mileAgeController = TextEditingController();
  TextEditingController sellerNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    typeController.text = widget.vehicleType;
    return Scaffold(
      appBar: AppBar(
        title: Text("For Sale".tr),
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
                'Fill the Vehicle Details'.tr,
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

            /*Container(
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
            ),*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                enabled: false,
                controller: typeController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Type",
                  hintText: "Type",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 17,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: brandController,
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

            SizedBox(
              height: 17,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: modelController,
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

            SizedBox(
              height: 17,
            ),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: manufacYearController,
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

            SizedBox(
              height: 1,
            ),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Container(
              width: 950,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AppDropDownMenu(
                locationList: Constants().conditionTypeList,
                label: "",
                hintText: "Condition",
                onSelected: (vehicle) {
                  conditionController.text = vehicle;
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
                  transmissionController.text = vehicle;
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
                  fuelTypeController.text = vehicle;
                },
              ),
            ),

            SizedBox(
              height: 17,
            ),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: engineCapacityController,
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

            SizedBox(
              height: 17,
            ),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: mileAgeController,
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

            SizedBox(
              height: 17,
            ),

            //open button ----------------
            ElevatedButton(
              onPressed: () {
                openImages();
              },
              child: Text("Add Photos".tr),
              style: ElevatedButton.styleFrom(
                primary: Constants.appColorAmberMoreDark,
              ),
            ),

            // Divider(),
            // Text("Picked Images:"),
            // Divider(),

            SizedBox(
              height: 5,
            ),

            imagefiles != null
                ? Wrap(
                    children: imagefiles.map((imageone) {
                      return Container(
                          child: Card(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.file(File(imageone.path)),
                        ),
                      ));
                    }).toList(),
                  )
                : Container(),

            SizedBox(
              height: 20,
            ),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: sellerNameController,
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

            SizedBox(
              height: 17,
            ),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: cityController,
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

            SizedBox(
              height: 17,
            ),

            /*____Mandatory Kranna (REQUIRED FIELD EKK KRANNA)*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: priceController,
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

            SizedBox(
              height: 17,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: contactNoController,
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

            SizedBox(
              height: 17,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        if (isValidate()) {
                          vehicleSaleController.addVehicleAd(
                              vehicleId: widget.vehicleId.toString(),
                              type: typeController.text,
                              brand: brandController.text,
                              model: modelController.text,
                              manufacDate: manufacYearController.text,
                              condition: conditionController.text,
                              transmission: transmissionController.text,
                              fuelType: fuelTypeController.text,
                              engineCapacity: engineCapacityController.text,
                              Mileage: mileAgeController.text,
                              imagefiles: imagefiles,
                              sellerName: sellerNameController.text,
                              city: cityController.text,
                              price: priceController.text,
                              contactNo: contactNoController.text);
                        }
                      },
                      child: Text(
                        'SAVE & POST'.tr,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                    ),
                  ),
                ],
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

  bool isValidate() {
    if (typeController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Enter the type");
      return false;
    } else if (brandController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Enter the brand");
      return false;
    } else if (modelController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Enter the model");
      return false;
    } else if (manufacYearController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Enter the Manufactured Year");
      return false;
    } else if (conditionController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Pick the Condition");
      return false;
    } else if (transmissionController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Pick the Transmission type");
      return false;
    } else if (fuelTypeController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Pick the Fuel type");
      return false;
    } else if (engineCapacityController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Enter the Engine Capacity");
      return false;
    } else if (mileAgeController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Enter the Mileage");
      return false;
    } else if (sellerNameController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Enter the Seller Name");
      return false;
    } else if (cityController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Enter the City");
      return false;
    } else if (priceController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Enter the Price");
      return false;
    } else if (contactNoController.text.isEmpty) {
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Please Enter the Contact No");
      return false;
    } else {
      return true;
    }
  }
}
