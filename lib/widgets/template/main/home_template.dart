
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../../../const/constants.dart';
import '../../../screens/main/add_appointment_screen.dart';
import '../../../screens/main/sell_your_vehicle_screen.dart';
import '../../../screens/main/selling_vehicle_details_screen.dart';
import '../../../screens/main/view_appointment_screen.dart';
import '../../../screens/main/view_service_history_screen.dart';
import '../../molecules/containers/campaign_card_view.dart';
import '../../molecules/containers/drawer.dart';



class HomeTemplate extends StatefulWidget {
  final List<Map<String, dynamic>> menuBtnData;

  HomeTemplate({Key? key, required this.menuBtnData}) : super(key: key);

  @override
  State<HomeTemplate> createState() => _HomeTemplateState();
}



class _HomeTemplateState extends State<HomeTemplate> {
  @override
  Widget build(BuildContext context) {

    //FirebaseAuth.instance.signOut();  //authentication token eka ain krla daanawa meeken

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

      body: Container(
        child: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppBar().preferredSize.height * 0.4,),
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/location_one.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/location_two.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/location_three.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],

                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 11 / 9,
                    autoPlayCurve: Curves.decelerate,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),

                SizedBox(height: 20,),

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
                      text: "Appointments",
                    ),
                    Tab(
                      icon: Icon(Icons.sell_outlined),
                      text: "Selling Vehicles",
                    ),
                  ],
                ),

                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Center(   //Appointments tab
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Center(child: Padding(
                                              padding: const EdgeInsets.only(top: 16.0),
                                              child: Text("",style: TextStyle(fontSize: 16),),
                                            ),),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("assets/icons/add_appointment.png",),
                                                )
                                            ),
                                            height: 70,
                                            width: 70,
                                          ),

                                          TextButton(
                                            child: const Text(
                                              'ADD AN APPOINTMENT',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                  builder: (BuildContext context) => AddAppointmentScreen()
                                              ));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 20,),

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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Center(child: Padding(
                                              padding: const EdgeInsets.only(top: 16.0),
                                              child: Text("",style: TextStyle(fontSize: 16),),
                                            ),),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("assets/icons/view_appointment.png",),
                                                )
                                            ),
                                            height: 70,
                                            width: 70,
                                          ),

                                          TextButton(
                                            child: const Text(
                                              'VIEW APPOINTMENTS',
                                              style: TextStyle(
                                                color: Colors.lightBlue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                  builder: (BuildContext context) => ViewAppointmentScreen(),
                                              ));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 20,),

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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Center(child: Padding(
                                              padding: const EdgeInsets.only(top: 16.0),
                                              child: Text("",style: TextStyle(fontSize: 16),),
                                            ),),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("assets/icons/appointmnt_removebg.png",),
                                                )
                                            ),
                                            height: 70,
                                            width: 70,
                                          ),

                                          TextButton(
                                            child: const Text(
                                              'HISTORY OF SERVICES',
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                builder: (BuildContext context) => ViewServiceHistoryScreen(),
                                              ));
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
                        child: Column(    //Selling Vehicles tab
                          children: [
                            SizedBox(height : 20),
                            //Text("(Below gesture detector can click and go to the vehicle)"),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton.icon(
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Constants.appColorAmberDark,
                                  ),
                                  label: Text(
                                    "Sell your vehicle",
                                    style: TextStyle(
                                      color : Constants.appColorBlack,
                                      fontSize: 17,
                                    ),
                                  ),
                                  onPressed: (){
                                    print("Button 'Sell your vehicle' clicked!");
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (BuildContext context) => SellYourVehicleScreen(),
                                    ));
                                  },
                                ),
                              ],
                            ),

                            SizedBox(height: 10,),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Text(
                                    'All Vehicles For Sale',
                                    style: TextStyle(
                                      color: Constants.appColorBlack,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),


                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  print("printed gesture detector");
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) => SellingVehicleDetailsScreen(),
                                  ));
                                },
                                child: CampaignCardView(
                                  title: "Honda Civic 2007",
                                  imgUrl: "assets/images/honda_civic.png",
                                  location: "Gampaha",
                                  price: "Rs. 5,590,000",
                                  distance: "129000km",
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  print("printed gesture detecture");
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) => SellingVehicleDetailsScreen(),
                                  ));
                                },
                                child: CampaignCardView(
                                  title: "Toyota Vitz 2015",
                                  imgUrl: "assets/images/toyota_vitz_2015.png",
                                  location: "Kadawatha",
                                  price: "Rs. 6,550,000",
                                  distance: "85000km",
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  print("printed gesture detecture");
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) => SellingVehicleDetailsScreen(),
                                  ));
                                },
                                child: CampaignCardView(
                                  title: "Toyota Vitz 2015",
                                  imgUrl: "assets/images/toyota_vitz_2015.png",
                                  location: "Kadawatha",
                                  price: "Rs. 6,550,000",
                                  distance: "85000km",
                                ),
                              ),
                            ),
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
      ),
    );
  }
}


