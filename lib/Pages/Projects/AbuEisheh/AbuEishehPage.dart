import 'package:ahmed_portfolio/Pages/Projects/AbuEisheh/Responsive/AbuEishehPageMobile.dart';
import 'package:ahmed_portfolio/Pages/Projects/AbuEisheh/Responsive/AbuEishehPageTablet.dart';
import 'package:ahmed_portfolio/Pages/Projects/AbuEisheh/Responsive/AbuEishehPageWeb.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AbuEishehPage extends StatelessWidget {
  const AbuEishehPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return AbuEishehPageMobile();
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return AbuEishehPageTablet();
        } else
          return AbuEishehPageWeb();
      },
    );
  }
}
