import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../const/constants.dart';

class AppMultiLineInputField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final TextInputType inputType;
  final MultiValidator validator;
  final String hintText;
  Color? color;
  int? minLine;
  int? maxLine;

  AppMultiLineInputField({
    Key? key,
    required this.formKey,
    required this.controller,
    required this.inputType,
    required this.validator,
    this.color = Constants.appColorGray,
    required this.hintText,
    this.minLine,
    this.maxLine = 5
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
          controller: controller,
          textAlign: TextAlign.left,
          style: TextStyle(color: Constants.appColorBlack, fontSize: 14),
          keyboardType: inputType,
          minLines: minLine,
          maxLines: maxLine,
          decoration: InputDecoration(
              filled: true,
              fillColor: Constants.appColorGray.withOpacity(0.3),
              hintStyle: TextStyle(color: color, fontSize: 14),
              hintText: hintText,

              /*enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),*/
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              )
          ),

          validator: validator
      ),
    );
  }
}
