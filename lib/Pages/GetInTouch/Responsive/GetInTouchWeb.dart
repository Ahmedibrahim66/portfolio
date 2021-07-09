import 'package:ahmed_portfolio/Pages/MainPage/bloc/main_page_bloc.dart';
import 'package:ahmed_portfolio/Widgets/WebWidgets/WebAnimatedSlide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetInTouchPageWeb extends StatefulWidget {
  @override
  _GetInTouchPageWebState createState() => _GetInTouchPageWebState();
}

class _GetInTouchPageWebState extends State<GetInTouchPageWeb>
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
          if (state is ShowGetInTouchPage) {
            setState(() {
              startAnimation = true;
              portfoilioTextAnimationcontroller.forward();
              cardSizeAnimationController.forward();
            });
          } else {
            setState(() {
              startAnimation = false;
              portfoilioTextAnimationcontroller.reverse();
              cardSizeAnimationController.reverse();
            });
          }
        },
        child: WebAnimatedSlide(
          height: height,
          width: width,
          startAnimation: startAnimation,
          image: "Images/GetInTouch/getintouch.png",
          buttonText: "Show me more",
          haveButton: false,
          number: "04",
          subtitle: "ahmedibrahimrip@gmail.com",
          title: "Get In Touch",
          sizeTransitionController: cardSizeAnimationController,
          isProject: false,
        ));
  }
}
