import 'package:ahmed_portfolio/Pages/HomePage/Responsive/HomePageMobile.dart';
import 'package:ahmed_portfolio/Pages/HomePage/Responsive/HomePageTablet.dart';
import 'package:ahmed_portfolio/Pages/HomePage/Responsive/HomePageWeb.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return HomePageMobile();
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return HomePageTablet();
        } else
          return HomePageWeb();
      },
    );
  }
}
