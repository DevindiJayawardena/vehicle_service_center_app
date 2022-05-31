import 'package:flutter/material.dart';

import '../../widgets/template/main/add_appointment_template.dart';

class AddAppointmentScreen extends StatelessWidget {
  bool isEdit;
  String? appointmentId;
  AddAppointmentScreen({Key? key, required this.isEdit, this.appointmentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddAppointmentTemplate(isEdit: isEdit, appointmentId: appointmentId);
  }
}
