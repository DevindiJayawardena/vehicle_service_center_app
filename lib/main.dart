import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vehicle_service_center_app/screens/auth/sign_up_screen.dart';
import 'package:vehicle_service_center_app/screens/startup/onboarding_screen.dart';
import 'const/constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final bool _isLogged = true;
  final bool _isAppInstalled = false;
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service Center',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: FeedbackScreen(),
      home: SignUpScreen(),
      // home: FutureBuilder(
      //     future: Init.instance.initialize(),
      //     builder: (context, AsyncSnapshot snapshot){
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return SplashLoading();
      //       }
      //       return UpComingScreen();
      //     }
      // ),
    );
  }
}
class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.
    await Constants().getAppInstalledDataInSF(Constants.IS_APP_INSTALLED);
    await Future.delayed(const Duration(seconds: 2));
  }
}

class SplashLoading extends StatelessWidget {
  const SplashLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.appColorAmber,
      body: Center(
        child: Image.asset("assets/icons/logo.png",height: 350,width: 300,),
      ),
    );
  }
}



class UpComingScreen extends StatelessWidget {
  const UpComingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getScreen();
  }

  Widget getScreen(){
    if(!Constants.isInstalled){
      return OnBoardingScreen();
    }else {
      return SignUpScreen();
    }
  }

}























