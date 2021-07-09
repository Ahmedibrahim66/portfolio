import 'package:ahmed_portfolio/Pages/MainPage/bloc/main_page_bloc.dart';
import 'package:ahmed_portfolio/Widgets/TabletWidgets/TabletAnimatedSlide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpartanFitnessPageTablet extends StatefulWidget {
  @override
  _SpartanFitnessPageTabletState createState() =>
      _SpartanFitnessPageTabletState();
}

class _SpartanFitnessPageTabletState extends State<SpartanFitnessPageTablet>
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
        child: TabletAnimatedSlide(
          height: height,
          width: width,
          startAnimation: startAnimation,
          image: "Images/Projects/abueisheh.jpeg",
          buttonText: "Show me more",
          haveButton: true,
          number: "03",
          subtitle:
              "Cross-Platform Mobile Application built for Spartan Fitness Gym",
          title: "Spartan Fitness",
          sizeTransitionController: cardSizeAnimationController,
        ));
  }
}
