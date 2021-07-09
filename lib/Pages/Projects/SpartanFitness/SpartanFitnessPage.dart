import 'package:ahmed_portfolio/Pages/Projects/AbuEisheh/Responsive/AbuEishehPageTablet.dart';
import 'package:ahmed_portfolio/Pages/Projects/SpartanFitness/Responsive/SpartanFitnessPageMobile.dart';
import 'package:ahmed_portfolio/Pages/Projects/SpartanFitness/Responsive/SpartanFitnessPageTablet.dart';
import 'package:ahmed_portfolio/Pages/Projects/SpartanFitness/Responsive/SpartanFitnessPageWeb.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SpartanFitnessPage extends StatelessWidget {
  const SpartanFitnessPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return SpartanFitnessPageMobile();
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return SpartanFitnessPageTablet();
        } else
          return SpartanFitnessPageWeb();
      },
    );
  }
}
