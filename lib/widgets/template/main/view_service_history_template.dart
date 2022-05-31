import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_service_center_app/controller/service_history_controller.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/app_dropdown_menu.dart';
import '../../molecules/containers/campaign_card_view_for_service_history.dart';
import '../../molecules/containers/drawer.dart';

class ViewServiceHistoryTemplate extends StatefulWidget {
  const ViewServiceHistoryTemplate({Key? key}) : super(key: key);

  @override
  _ViewServiceHistoryTemplateState createState() =>
      _ViewServiceHistoryTemplateState();
}

class _ViewServiceHistoryTemplateState
    extends State<ViewServiceHistoryTemplate> {
  ServiceHistoryController serviceHistoryController =
      Get.find<ServiceHistoryController>();
  String selectedVehicle = "";
  String selectedServiceType = "";
  final userBox = GetStorage('userBox');

  @override
  Widget build(BuildContext context) {
    var token = userBox.read('token');
    var userId = userBox.read('id');
    List<dynamic> vehicleMap = [];
    serviceHistoryController.vehicles.data?.forEach((element) {
      vehicleMap.add({'id': element.id, 'label': element.vehicleNumber});
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Service History"),
        backgroundColor: Constants.appColorAmber,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 360,
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: AppDropDownMenu(
                  locationList: vehicleMap,
                  label: "Vehicle",
                  hintText: vehicleMap.length == 0
                      ? "Select Your Vehicle"
                      : vehicleMap[0]['label'],
                  onSelected: (vehicle) {
                    selectedVehicle = vehicle;
                    print(selectedVehicle);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 800,
              child: ListView.builder(
                  itemCount: serviceHistoryController
                      .serviceHistory.value.data?.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.all(12),
                      child: CampaignCardViewForServiceHistory(
                        imgUrl: 'assets/icons/history_removebg.png',
                        vehicleNo: serviceHistoryController
                            .serviceHistory.value.data![index].vehicleNumber!,
                        serviceType: serviceHistoryController
                            .serviceHistory.value.data![index].upgradeTypeName!,
                        price:
                            "Rs ${serviceHistoryController.serviceHistory.value.data![index].price} - ${serviceHistoryController.serviceHistory.value.data![index].paymentMethod} payment",
                        time: serviceHistoryController
                            .serviceHistory.value.data![index].date!,
                      ),
                    );
                  }),
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
