import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_service_center_app/model/custmer_vehicle.dart';

import '../../widgets/template/main/view_vehicles_template.dart';

class ViewVehiclesScreen extends StatelessWidget {
  CustomerVehicle customerVehicle = Get.arguments[0];
  ViewVehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewVehiclesTemplate(
      customerVehicle: customerVehicle,
    );
  }
}
