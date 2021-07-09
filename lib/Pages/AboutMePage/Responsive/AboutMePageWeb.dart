import 'package:ahmed_portfolio/Pages/AboutMePage/MoreInfo/Responsive/moreInfoWeb.dart';
import 'package:ahmed_portfolio/Pages/MainPage/bloc/main_page_bloc.dart';
import 'package:ahmed_portfolio/Widgets/WebWidgets/WebAnimatedSlide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AboutMePageWeb extends StatefulWidget {
  @override
  _AboutMePageWebState createState() => _AboutMePageWebState();
}

class _AboutMePageWebState extends State<AboutMePageWeb>
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
          if (state is ShowAboutMePage) {
            setState(() {
              startAnimation = true;
              portfoilioTextAnimationcontroller.forward();
            });
          } else if (state is ShowMoreInfoPageAnimation ||
              state is ShowBackToMainPageAnimation) {
            print("test");
          } else {
            setState(() {
              startAnimation = false;
              portfoilioTextAnimationcontroller.reverse();
            });
          }
        },
        child: WebAnimatedSlide(
          height: height,
          width: width,
          startAnimation: startAnimation,
          image: "Images/AboutMe/aboutme.png",
          buttonText: "Show me more",
          haveButton: true,
          number: "01",
          subtitle: "I love Programming, Design and some Gaming",
          title: "About Me",
          onTap: () {
            //Event to notify animations
            BlocProvider.of<MainPageBloc>(context).add(NavigateToMoreInfo());

            //push to next page
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInCubic,
                    reverseDuration: Duration(seconds: 1),
                    alignment: Alignment.bottomCenter,
                    child: BlocProvider.value(
                      value: BlocProvider.of<MainPageBloc>(context),
                      child: AboutMeMoreInfoWeb(),
                    )));
          },
          isProject: false,
        ));
  }
}
