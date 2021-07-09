import 'package:ahmed_portfolio/Pages/AboutMePage/MoreInfo/Responsive/moreInfoMobile.dart';
import 'package:ahmed_portfolio/Pages/AboutMePage/MoreInfo/Responsive/moreInfoWeb.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MoreInfoPage extends StatelessWidget {
  const MoreInfoPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return AboutMeMoreInfoMobile();
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return AboutMeMoreInfoMobile();
        } else
          return AboutMeMoreInfoWeb();
      },
    );
  }
}
