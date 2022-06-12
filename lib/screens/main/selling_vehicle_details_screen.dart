import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_service_center_app/model/sale_vehicle.dart';

import '../../widgets/template/main/selling_vehicle_details_template.dart';

class SellingVehicleDetailsScreen extends StatelessWidget {
  Data data = Get.arguments[0];
  SellingVehicleDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SellingVehicleDetailsTemplate(vehicleData: data);
  }
}
