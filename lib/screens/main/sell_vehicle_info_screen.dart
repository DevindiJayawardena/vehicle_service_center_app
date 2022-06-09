import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/template/main/sell_vehicle_info_template.dart';

class SellVehicleInfoScreen extends StatelessWidget {
  int vehicleId = Get.arguments[0];
  String vehicleType = Get.arguments[1];
  SellVehicleInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SellVehicleInfoTemplate(
        vehicleId: vehicleId, vehicleType: vehicleType);
  }
}
