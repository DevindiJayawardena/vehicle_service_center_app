
import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../atoms/app_label.dart';

class CampaignCardView extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String location;
  final String price;
  final String distance;

  CampaignCardView({
    Key? key,
    required this.title,
    required this.imgUrl,
    required this.location,
    required this.price,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 9,
          shadowColor: Colors.grey,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical : 8.0),
            child: Container(
              width: double.infinity,
              height: 120,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Image.asset(
                      imgUrl,
                      width: 167,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppLabel(text: title,
                              widgetSize: WidgetSize.large,
                              textColor: Constants.appColorAmberMoreDark,
                              fontWeight: FontWeight.w500,
                            ),
                            AppLabel(text: location,
                              widgetSize: WidgetSize.medium,
                              textColor: Constants.appColorAmberDark,
                              fontWeight: FontWeight.w500,
                            ),
                            AppLabel(text: price,
                              widgetSize: WidgetSize.medium,
                              textColor: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                            AppLabel(text: distance,
                              widgetSize: WidgetSize.small,
                              textColor: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}