import 'package:ahmed_portfolio/Pages/MainPage/bloc/main_page_bloc.dart';
import 'package:ahmed_portfolio/Widgets/MobileWidgets/MobileAnimatedSlide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbuEishehPageMobile extends StatefulWidget {
  @override
  _AbuEishehPageMobileState createState() => _AbuEishehPageMobileState();
}

class _AbuEishehPageMobileState extends State<AbuEishehPageMobile>
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
          if (state is ShowAbuEishehPage) {
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
          image: "Images/Projects/abueisheh.jpeg",
          buttonText: "Show me more",
          haveButton: true,
          number: "02",
          subtitle:
              "Cross-Platform Mobile Application built for Abu-Eisheh Car Dealership",
          title: "AE Motors",
          sizeTransitionController: cardSizeAnimationController,
          isProject: true,
          appStore: "https://apps.apple.com/lv/app/ae-motors/id1544498733",
          playStore:
              "https://play.google.com/store/apps/details?id=com.AbuEishehMotors.AE_motors",
        ));
  }
}
