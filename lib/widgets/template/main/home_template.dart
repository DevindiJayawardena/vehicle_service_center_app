import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_service_center_app/controller/appoinment_controller.dart';
import 'package:vehicle_service_center_app/controller/vehicle_sale_controller.dart';

import '../../../const/app_colors.dart';
import '../../../const/constants.dart';
import '../../../const/custom_snack_bar.dart';
import '../../../controller/service_history_controller.dart';
import '../../../screens/main/selling_vehicle_details_screen.dart';
import '../../molecules/containers/campaign_card_view.dart';
import '../../molecules/containers/drawer.dart';
import '../../shimmers/home_shimmer.dart';

class HomeTemplate extends StatefulWidget {
  final List<Map<String, dynamic>> menuBtnData;

  HomeTemplate({Key? key, required this.menuBtnData}) : super(key: key);

  @override
  State<HomeTemplate> createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  AppointmentController appointmentController =
      Get.put(AppointmentController(), permanent: true);
  ServiceHistoryController serviceHistoryController =
      Get.put(ServiceHistoryController());

  VehicleSaleController vehicleSaleController =
      Get.put(VehicleSaleController());

  @override
  Widget build(BuildContext context) {
    final userBox = GetStorage('userBox');
    var token = userBox.read('token');
    var id = userBox.read('id');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Constants.appColorAmber,
        elevation: 0,
        title: Text(""),
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
      body: FutureBuilder(
        future: Future.wait([
          appointmentController.getAllCarousels(),
          appointmentController.getAllSaleVehicles()
        ]),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            CustomSnackBar.buildSnackBar(
                title: "Alert".tr,
                message: "Something went wrong".tr,
                bgColor: AppColors.appColorBlack);
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomeShimmer();
          }
          return Container(
            child: SafeArea(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppBar().preferredSize.height * 0.4,
                    ),
                    appointmentController.imgList.length != 0
                        ? CarouselSlider(
                            items: appointmentController.imgList
                                .map((src) => Container(
                                      margin: EdgeInsets.all(3.0),
                                      child: Image.memory(src),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                              height: 180.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 11 / 9,
                              autoPlayCurve: Curves.decelerate,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              viewportFraction: 0.8,
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.all(3.0),
                            child: Image.asset(
                              "assets/images/default_banner.jpg",
                              fit: BoxFit.cover,
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonsTabBar(
                      backgroundColor: Constants.appColorAmberDark,
                      unselectedBackgroundColor: Colors.grey[300],
                      unselectedLabelStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      tabs: [
                        Tab(
                          icon: Icon(Icons.schedule_outlined),
                          text: "Appointments".tr,
                        ),
                        Tab(
                          icon: Icon(Icons.sell_outlined),
                          text: "Selling Vehicles".tr,
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Center(
                              //Appointments tab
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                    elevation: 7,
                                    shadowColor: Constants.appColorGray,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16.0),
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/icons/add_appointment.png",
                                                  ),
                                                )),
                                                height: 70,
                                                width: 70,
                                              ),
                                              TextButton(
                                                child: Text(
                                                  'ADD AN APPOINTMENT'.tr,
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  appointmentController
                                                      .addAppointment(
                                                          token: token,
                                                          id: "$id",
                                                          isEdit: false);
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                    elevation: 7,
                                    shadowColor: Constants.appColorGray,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16.0),
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/icons/view_appointment.png",
                                                  ),
                                                )),
                                                height: 70,
                                                width: 70,
                                              ),
                                              TextButton(
                                                child: Text(
                                                  'VIEW APPOINTMENTS'.tr,
                                                  style: TextStyle(
                                                    color: Colors.lightBlue,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  /*Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          ViewAppointmentScreen(),
                                                ));*/
                                                  appointmentController
                                                      .getAllAppointment(
                                                          token, "$id");
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                    elevation: 7,
                                    shadowColor: Constants.appColorGray,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16.0),
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/icons/appointmnt_removebg.png",
                                                  ),
                                                )),
                                                height: 70,
                                                width: 70,
                                              ),
                                              TextButton(
                                                child: Text(
                                                  'HISTORY OF SERVICES'.tr,
                                                  style: TextStyle(
                                                    color: Colors.deepOrange,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  serviceHistoryController
                                                      .getInitHistory();
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              //Selling Vehicles tab
                              children: [
                                SizedBox(height: 20),
                                //Text("(Below gesture detector can click and go to the vehicle)"),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton.icon(
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Constants.appColorAmberDark,
                                      ),
                                      label: Text(
                                        "Sell your vehicle".tr,
                                        style: TextStyle(
                                          color: Constants.appColorBlack,
                                          fontSize: 17,
                                        ),
                                      ),
                                      onPressed: () {
                                        vehicleSaleController
                                            .viewCustomerVehicleForSale();

                                        /*Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SellYourVehicleScreen(),
                                      ));*/
                                      },
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0),
                                      child: Text(
                                        'All Vehicles For Sale'.tr,
                                        style: TextStyle(
                                          color: Constants.appColorBlack,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                appointmentController.saleVehicle.data == null
                                    ? Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 150),
                                        child: Text(
                                          "No Data Available",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ))
                                    : SizedBox(
                                        height: 400,
                                        child: ListView.builder(
                                            itemCount: appointmentController
                                                .saleVehicle.data?.length,
                                            itemBuilder: (ctx, i) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.to(
                                                        () =>
                                                            SellingVehicleDetailsScreen(),
                                                        arguments: [
                                                          appointmentController
                                                              .saleVehicle
                                                              .data![i]
                                                        ]);
                                                  },
                                                  child: CampaignCardView(
                                                    title:
                                                        "${appointmentController.saleVehicle.data![i].brand} ${appointmentController.saleVehicle.data![i].model}  ${appointmentController.saleVehicle.data![i].manufacturedYear}",
                                                    imgUrl:
                                                        appointmentController
                                                            .saleVehicle
                                                            .data![i]
                                                            .thumbnail,
                                                    location:
                                                        "${appointmentController.saleVehicle.data![i].city}",
                                                    price:
                                                        "${appointmentController.saleVehicle.data![i].price}",
                                                    distance:
                                                        "${appointmentController.saleVehicle.data![i].mileage}",
                                                  ),
                                                ),
                                              );
                                            }),
                                      )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
