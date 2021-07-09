import 'package:ahmed_portfolio/Pages/GetInTouch/Responsive/GetInTouchMobile.dart';
import 'package:ahmed_portfolio/Pages/GetInTouch/Responsive/GetInTouchTablet.dart';
import 'package:ahmed_portfolio/Pages/GetInTouch/Responsive/GetInTouchWeb.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GetInTouchPage extends StatelessWidget {
  const GetInTouchPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return GetInTouchPageMobile();
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return GetInTouchTablet();
        } else
          return GetInTouchPageWeb();
      },
    );
  }
}
