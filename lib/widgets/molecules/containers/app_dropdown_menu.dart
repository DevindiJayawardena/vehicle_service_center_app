import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../atoms/app_label.dart';

class AppDropDownMenu extends StatelessWidget {
  final List<dynamic> locationList;
  final String label;
  final Color? labelColor;
  final String hintText;
  String? locationName;
  final Function onSelected;

  AppDropDownMenu(
      {Key? key,
      required this.locationList,
      required this.label,
      this.labelColor = Constants.appColorAmberDark,
      required this.hintText,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLabel(
          text: label,
          widgetSize: WidgetSize.large,
          textColor: labelColor,
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.93,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(6),
            color: Constants.appColorWhite.withOpacity(0.5),
          ),
          child: FormHelper.dropDownWidget(
            context,
            hintText,
            this.locationName,
            this.locationList,
            (onChangedValue) {
              this.locationName = onChangedValue;
              print(onChangedValue);
              onSelected(locationName);
            },
            (onValidateValue) {
              if (onValidateValue == null) {
                return "please Select a Location";
              }
              return null;
            },
            borderRadius: 0,
            optionValue: "id",
            optionLabel: "label",
            borderColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
