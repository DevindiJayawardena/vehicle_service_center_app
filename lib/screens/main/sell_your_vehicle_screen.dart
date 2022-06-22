import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/customer_not_sale_vehicle.dart';
import '../../widgets/template/main/sell_your_vehicle_template.dart';

class SellYourVehicleScreen extends StatelessWidget {
  CustomerNotSaledVehicle customerVehicle = Get.arguments[0];
  SellYourVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SellYourVehicleTemplate(customerVehicle: customerVehicle);
  }
}
