import 'package:ahmed_portfolio/Constants/AppColors.dart';
import 'package:ahmed_portfolio/Constants/Fonts.dart';
import 'package:ahmed_portfolio/Pages/AboutMePage/AboutMePage.dart';
import 'package:ahmed_portfolio/Pages/GetInTouch/GetInTouch.dart';
import 'package:ahmed_portfolio/Pages/HomePage/HomePage.dart';
import 'package:ahmed_portfolio/Pages/MainPage/Responsive/MainPageMobile.dart';
import 'package:ahmed_portfolio/Pages/MainPage/Responsive/MainPageTablet.dart';
import 'package:ahmed_portfolio/Pages/MainPage/Responsive/MainPageWeb.dart';
import 'package:ahmed_portfolio/Pages/Projects/AbuEisheh/AbuEishehPage.dart';
import 'package:ahmed_portfolio/Pages/Projects/SpartanFitness/SpartanFitnessPage.dart';
import 'package:ahmed_portfolio/Pages/WidgetKeys/WidgetKeys.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //list of pages/slides it is initialzied in initState
  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      HomePage(
        key: WidgetKeys.dataKey,
      ),
      AboutMePage(
        key: WidgetKeys.dataKey1,
      ),
      AbuEishehPage(
        key: WidgetKeys.dataKey2,
      ),
      SpartanFitnessPage(
        key: WidgetKeys.dataKey3,
      ),
      GetInTouchPage(
        key: WidgetKeys.dataKey4,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MainPageMobile(
            pages: pages,
          );
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return Scaffold(
            backgroundColor: darkBlue,
            body: Container(
              child: Center(
                child: Text(
                  "Tablet Implementation Coming Soon",
                  style: gilroyBold.copyWith(
                    color: Colors.white,
                    fontSize: 45,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
          // return MainPageTablet(
          //   pages: pages,
          // );
        } else
          return MainPageWeb(
            pages: pages,
          );
      },
    );
  }
}
