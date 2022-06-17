import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_service_center_app/controller/appoinment_controller.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/campaign_card_view_for_appointments.dart';
import '../../molecules/containers/drawer.dart';

class ViewAppointmentTemplate extends StatelessWidget {
  AppointmentController appointmentController =
      Get.find<AppointmentController>();
  ViewAppointmentTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.appColorAmber,
          elevation: 0,
          title: Text("Your Appointments"),
          // leading: IconButton(
          //     onPressed: () {
          //       print("notification");
          //     },
          //     icon: Icon(
          //       Icons.view_headline,
          //       color: Constants.appColorAmber,
          //     )),
          // actions: [],
        ),
        drawer: DrawerWidget(),
        body: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 700,
                child: ListView.builder(
                    itemCount: appointmentController.appointment.data?.length,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        child: CampaignCardViewForAppointments(
                          vehicleType: appointmentController
                              .appointment.data![index].vehicleNumber
                              .toString(),
                          imgUrl: "assets/images/appointment_two.png",
                          appointmentId: appointmentController
                              .appointment.data![index].id
                              .toString(),
                          serviceType: appointmentController
                              .appointment.data![index].upgradeTypeName!,
                          //distance: "85000km",
                          time: appointmentController
                              .appointment.data![index].date!,
                          status: appointmentController
                              .appointment.data![index].status!,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ));
  }
}
