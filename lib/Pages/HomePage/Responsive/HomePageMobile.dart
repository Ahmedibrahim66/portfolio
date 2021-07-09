import 'package:ahmed_portfolio/Constants/AppColors.dart';
import 'package:ahmed_portfolio/Constants/Fonts.dart';
import 'package:ahmed_portfolio/Pages/MainPage/bloc/main_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageMobile extends StatefulWidget {
  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile>
    with TickerProviderStateMixin {
  bool startAnimation = false;

  var portfoilioTextanimation;
  AnimationController portfoilioTextAnimationcontroller;

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
          if (state is ShowHomePage) {
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
        child: Container(
          height: height - 200,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 34,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AnimatedPositioned(
                                  duration:
                                      Duration(seconds: 1, milliseconds: 900),
                                  curve: !startAnimation
                                      ? Curves.easeInCubic
                                      : Curves.easeOutCubic,
                                  left: startAnimation ? 20 : -width / 2,
                                  child: FadeTransition(
                                    opacity: portfoilioTextanimation,
                                    child: Container(
                                      width: 350,
                                      child: Text(
                                        "Portfolio",
                                        style: gilroyBold.copyWith(
                                            fontSize: 34, color: appRed),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                        Container(
                          height: 40,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration:
                                    Duration(seconds: 1, milliseconds: 300),
                                curve: !startAnimation
                                    ? Curves.easeInCubic
                                    : Curves.easeOutCubic,
                                bottom: 0,
                                left: startAnimation ? 0 : -width * 2,
                                child: Text(
                                  "Ahmed",
                                  style: gilroyBold.copyWith(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration:
                                    Duration(seconds: 1, milliseconds: 300),
                                curve: !startAnimation
                                    ? Curves.easeInCubic
                                    : Curves.easeOutCubic,
                                bottom: 0,
                                left: startAnimation ? 0 : -width * 3,
                                child: Text(
                                  "Ibrahim",
                                  style: gilroyBold.copyWith(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 5,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration:
                                    Duration(seconds: 1, milliseconds: 600),
                                curve: !startAnimation
                                    ? Curves.easeInCubic
                                    : Curves.easeOutCubic,
                                bottom: 0,
                                left: startAnimation ? 0 : -width / 2,
                                child: AnimatedContainer(
                                  curve: Curves.easeInOutCubic,
                                  duration: Duration(milliseconds: 500),
                                  height: 2,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: appRed),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 5,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration:
                                    Duration(seconds: 1, milliseconds: 600),
                                curve: !startAnimation
                                    ? Curves.easeInCubic
                                    : Curves.easeOutCubic,
                                bottom: 0,
                                left: startAnimation ? 0 : -width / 2,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    AnimatedContainer(
                                      curve: !startAnimation
                                          ? Curves.easeInCubic
                                          : Curves.easeOutCubic,
                                      duration: Duration(milliseconds: 500),
                                      height: 2,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: appRed),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 80,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration:
                                    Duration(seconds: 1, milliseconds: 900),
                                curve: !startAnimation
                                    ? Curves.easeInCubic
                                    : Curves.easeOutCubic,
                                bottom: 0,
                                left: startAnimation ? 0 : -width * 3,
                                child: Container(
                                  width: width - 60,
                                  child: Text(
                                    "Software Engineer / Mobile and Backend developer",
                                    style: gilroyLight.copyWith(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
