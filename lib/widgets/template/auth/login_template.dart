import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../../controller/auth_controller.dart';
import '../../../screens/auth/forgot_password_screen.dart';
import '../../../screens/auth/sign_up_screen.dart';
import '../../atoms/app_heading.dart';
import '../../atoms/app_label.dart';
import '../../molecules/buttons/filled_rounded_button.dart';
import '../../molecules/buttons/ghost_button.dart';
import '../../molecules/input_fields/app_input_field.dart';
import '../../molecules/input_fields/app_password_field.dart';

class LoginTemplate extends StatefulWidget {
  final String heading;
  final String btnText;
  final String imgUrl;

  LoginTemplate({
    Key? key,
    required this.imgUrl,
    this.btnText = "Login",
    this.heading = "Login",
  }) : super(key: key);

  @override
  State<LoginTemplate> createState() => _LoginTemplateState();
}

class _LoginTemplateState extends State<LoginTemplate> {
  final GlobalKey<FormState> _usernameKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  AuthController authController = Get.put(AuthController());
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
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Constants.appColorAmber,
                    Constants.appColorAmberDark
                  ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    "assets/icons/logo_removebg.png",
                    width: 230,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          " ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Kanit-Bold",
                              fontSize: 30),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 1),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 32.0),
                              child: AppHeading(
                                text: widget.heading,
                                widgetSize: WidgetSize.large,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AppInputField(
                            formKey: _usernameKey,
                            controller: _usernameController,
                            inputType: TextInputType.text,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Email is Required"),
                              EmailValidator(errorText: "Enter a Valid Email")
                            ]),
                            iconData: Icons.person,
                            hintText: "User Name",
                            color: Constants.appColorBlack,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AppPasswordField(
                            formKey: _passwordKey,
                            controller: _passwordController,
                            inputType: TextInputType.text,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Password is Required"),
                              MinLengthValidator(8,
                                  errorText:
                                      "password must be at least 8 characters")
                            ]),
                            iconData: Icons.security,
                            hintText: "Password",
                            color: Constants.appColorBlack,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40.0),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: GhostButton(
                                color: Constants.appColorAmberMoreLight,
                                text: "Forgot Password?",
                                widgetSize: WidgetSize.medium,
                                clickEvent: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ForgotPasswordScreen()));
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: FilledRoundedButton(
                                  color: Constants.appColorBlack,
                                  text: widget.btnText,
                                  widgetSize: WidgetSize.large,
                                  clickEvent: () {
                                    //CHECKING THE INPUT DATA VALIDATION
                                    if (_isValidate()) {
                                      authController.emailLogin(
                                          _usernameController.text.trim(),
                                          _passwordController.text.trim());

                                      //_login();

                                    }
                                  })),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppLabel(
                                  text: "New to this App?",
                                  widgetSize: WidgetSize.medium),
                              GhostButton(
                                text: "Sign Up",
                                color: Constants.appColorAmberMoreLight,
                                widgetSize: WidgetSize.medium,
                                clickEvent: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SignUpScreen()));
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  bool _isValidate() {
    if (!_usernameKey.currentState!.validate()) {
      return false;
    } else if (!_passwordKey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }
}
