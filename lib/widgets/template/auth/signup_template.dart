import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../../screens/auth/forgot_password_screen.dart';
import '../../../screens/auth/login_screen.dart';
import '../../../screens/main/user_registeration_screen.dart';
import '../../atoms/app_heading.dart';
import '../../molecules/buttons/filled_rounded_button.dart';
import '../../molecules/buttons/ghost_button.dart';
import '../../molecules/containers/app_dropdown_menu.dart';
import '../../molecules/input_fields/app_input_field.dart';
import '../../molecules/input_fields/app_password_field.dart';


class SignUpTemplate extends StatefulWidget {
  final String heading;
  final String btnText;
  final String imgUrl;


  SignUpTemplate({Key? key,
    required this.heading,
    required this.btnText,
    required this.imgUrl, }) : super(key: key);

  @override
  State<SignUpTemplate> createState() => _SignUpTemplateState();
}

class _SignUpTemplateState extends State<SignUpTemplate> {

  GlobalKey<FormState> _emailKey = GlobalKey<FormState>();

  GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  GlobalKey<FormState> _confirmPasswordKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();

  bool isLoading = false;


  String? errorMessage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Constants.appColorAmberDark,
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Constants.appColorAmber,Constants.appColorAmberDark],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter
                  ),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.0))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 90,),
                  Image.asset("assets/icons/logo_removebg.png",width: 230,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(" ",style: TextStyle(
                            color: Colors.black,fontFamily: "Kanit-Bold",
                            fontSize: 30
                        ),),
                      )
                    ],
                  )
                ],
              ),

            ),

            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 5,),

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 32.0),
                              child: AppHeading(
                                text: widget.heading,
                                widgetSize: WidgetSize.large,
                              ),
                            ),
                          ),

                          SizedBox(height: 20,),

                          AppInputField(
                              formKey: _emailKey,
                              controller: _emailController,
                              inputType: TextInputType.emailAddress,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Email is Required"),
                                EmailValidator(errorText: "Enter a Valid Email")
                              ]),
                              iconData: Icons.email,
                              hintText: "Email",
                              color: Constants.appColorBlack,
                          ),

                          SizedBox(height: 30,),

                          AppPasswordField(
                            formKey: _passwordKey,
                            controller: _passwordController,
                            inputType: TextInputType.text,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Password is Required"),
                              MinLengthValidator(6, errorText: "password must be at least 6 characters")
                            ]),
                            iconData: Icons.security,
                            hintText: "Password",
                            color: Constants.appColorBlack,
                          ),

                          SizedBox(height: 40,),

                          Form(
                            key: _confirmPasswordKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: TextFormField(
                                  controller: _confirmPasswordController,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Constants.appColorBlack, fontSize: 14),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(

                                    icon: Icon(Icons.security,color: Constants.appColorBlack,size: 20,),
                                    hintStyle: TextStyle(color: Constants.appColorBlack, fontSize: 14),
                                    hintText: "Confirm Password",


                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Constants.appColorBlack),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Constants.appColorBlack),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Constants.appColorBlack),
                                    ),
                                  ),

                                  validator: (val){
                                    if(val!.isEmpty)
                                      return 'Re enter your password';
                                    if(val != _passwordController.text)
                                      return 'Password does not matched';
                                    return null;
                                  }
                              ),
                            ),
                          ),

                          SizedBox(height: 46,),

                          Container(
                              alignment: Alignment.center,
                              child: FilledRoundedButton(
                                  color: Constants.appColorBlack,
                                  text: widget.btnText,
                                  widgetSize: WidgetSize.large,
                                  clickEvent: (){
                                    //CHECKING THE INPUT DATA VALIDATION
                                    if(_isValidate()){

                                      //TAKING THE INPUT DATA
                                      print(_emailController.text.toString());
                                      print(_passwordController.text.toString());

                                      setState(() {
                                        isLoading = true;  // loading indicator eka wada krnwa dan
                                      });

                                      //signUpUser();

                                      //MOVING TO THE HOME IF DATA VALIDATED
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                           builder: (BuildContext context) => UserRegistrationScreen(),
                                      ));

                                    }
                                  }
                              )
                          ),



                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an Account?"),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Constants.appColorAmberMoreLight,
                                  ),
                                ),
                                onTap: (){
                                  //todo move to the sign in
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (BuildContext context) => LoginScreen()));
                                  print("Login");
                                },
                              )
                            ],
                          ),

                          SizedBox(height: 20,),

                        ],
                      ),
                    )
                ))
          ],
        ),
      ),
    );
  }



  bool _isValidate() {
    if (!_emailKey.currentState!.validate()) {
      return false;
    } else if (!_passwordKey.currentState!.validate()) {
      return false;
    }else if(!_confirmPasswordKey.currentState!.validate()){
      return false;
    } else {
      return true;
    }
  }


}










