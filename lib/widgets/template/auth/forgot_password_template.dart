import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../atoms/app_heading.dart';
import '../../atoms/app_label.dart';
import '../../molecules/buttons/filled_rounded_button.dart';
import '../../molecules/input_fields/app_input_field.dart';

class ForgotPasswordTemplate extends StatelessWidget {
  final String imgUrl;
  final String heading;
  final String description;
  final String btnText;

  final GlobalKey<FormState> _forgotEmailKey = GlobalKey<FormState>();
  final TextEditingController _forgotEmailController = TextEditingController();

  ForgotPasswordTemplate({
    Key? key,
    required this.imgUrl,
    this.heading = "Forgot\nPassword?",
    this.description = "Don’t worry ! It happens. Please enter the address associated with your account.",
    this.btnText = "Submit"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Constants.appColorWhite,
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(imgUrl),
                ),
              ),
            ),
            Expanded(child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: AppHeading(text: heading,widgetSize: WidgetSize.large,),
                        ),

                        SizedBox(height: 30,),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: AppLabel(text: description,widgetSize: WidgetSize.medium,),
                        ),

                        SizedBox(height: 30,),

                        AppInputField(
                          formKey: _forgotEmailKey,
                          controller: _forgotEmailController,
                          inputType: TextInputType.text,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Email is Required"),
                            EmailValidator(errorText: "Enter a Valid Email")
                          ]),
                          iconData: Icons.email,
                          hintText: "Email Address",
                        ),

                        SizedBox(height: 50,),

                        Container(
                            alignment: Alignment.center,
                            child: FilledRoundedButton(
                                text: btnText,
                                widgetSize: WidgetSize.large,
                                clickEvent: (){
                                  if(_isValidate()){
                                    print(_forgotEmailController.text.toString());
                                    print("GO TO THE NEXT STEP");
                                  }
                                }
                            )
                        ),

                        SizedBox(height: 40,),
                      ]
                  ),
                )
            ))
          ],
        ),
      ),
    );
  }

  bool _isValidate() {
    if (!_forgotEmailKey.currentState!.validate()) {
      return false;
    }else {
      return true;
    }
  }

}
