import 'package:ahmed_portfolio/Pages/AboutMePage/Responsive/AboutMePageMobile.dart';
import 'package:ahmed_portfolio/Pages/AboutMePage/Responsive/AboutMePageTablet.dart';
import 'package:ahmed_portfolio/Pages/AboutMePage/Responsive/AboutMePageWeb.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return AboutMePageMobile();
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return AboutMePageTablet();
        } else
          return AboutMePageWeb();
      },
    );
  }
}
