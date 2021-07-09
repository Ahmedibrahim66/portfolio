import 'package:ahmed_portfolio/Pages/MainPage/bloc/main_page_bloc.dart';
import 'package:ahmed_portfolio/Widgets/MobileWidgets/MobileAnimatedSlide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpartanFitnessPageMobile extends StatefulWidget {
  @override
  _SpartanFitnessPageMobileState createState() =>
      _SpartanFitnessPageMobileState();
}

class _SpartanFitnessPageMobileState extends State<SpartanFitnessPageMobile>
    with TickerProviderStateMixin {
  bool startAnimation = false;

  var portfoilioTextanimation;
  AnimationController portfoilioTextAnimationcontroller;

  var cardSizeAnimation;
  AnimationController cardSizeAnimationController;

  @override
  dispose() {
    portfoilioTextAnimationcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    portfoilioTextAnimationcontroller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2, milliseconds: 0),
        reverseDuration: Duration(milliseconds: 300));

    cardSizeAnimationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2, milliseconds: 0),
        reverseDuration: Duration(milliseconds: 999));

    portfoilioTextanimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(portfoilioTextAnimationcontroller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocListener<MainPageBloc, MainPageState>(
        listener: (context, state) async {
          if (state is ShowSpartanFitnessPage) {
            setState(() {
              startAnimation = true;
              portfoilioTextAnimationcontroller.forward();
            });
          } else {
            setState(() {
              startAnimation = false;
              portfoilioTextAnimationcontroller.reverse();
            });
          }
        },
        child: MobileAnimatedSlide(
          height: height,
          width: width,
          startAnimation: startAnimation,
          image: "Images/Projects/spartansFitness.png",
          buttonText: "Show me more",
          haveButton: true,
          number: "03",
          subtitle:
              "Cross-Platform Mobile Application built for Spartan Fitness Gym",
          title: "Spartan Fitness",
          sizeTransitionController: cardSizeAnimationController,
          isProject: true,
          appStore:
              "https://apps.apple.com/il/app/spartans-fitness-gym/id1558734112",
          playStore:
              "https://play.google.com/store/apps/details?id=il.android.spartans_fitness",
        ));
  }
}
