import 'package:ahmed_portfolio/Constants/AppColors.dart';
import 'package:ahmed_portfolio/Constants/Fonts.dart';
import 'package:ahmed_portfolio/Pages/MainPage/bloc/main_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({Key key}) : super(key: key);

  @override
  _HomePageWebState createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb>
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
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration:
                                    Duration(seconds: 1, milliseconds: 300),
                                curve: Curves.easeInOutCubic,
                                bottom: 0,
                                left: startAnimation ? 0 : -width / 2,
                                child: Text(
                                  "Ahmed",
                                  style: gilroyBold.copyWith(
                                      fontSize: 100, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration:
                                    Duration(seconds: 1, milliseconds: 300),
                                curve: !startAnimation
                                    ? Curves.easeInCubic
                                    : Curves.easeOutCubic,
                                bottom: 0,
                                left: startAnimation ? 0 : -width / 2,
                                child: Text(
                                  "Ibrahim",
                                  style: gilroyBold.copyWith(
                                      fontSize: 80, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
                                  height: 4,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: appRed),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                                      width: 50,
                                    ),
                                    AnimatedContainer(
                                      curve: !startAnimation
                                          ? Curves.easeInCubic
                                          : Curves.easeOutCubic,
                                      duration: Duration(milliseconds: 500),
                                      height: 4,
                                      width: 100,
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
                        SizedBox(height: 20),
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
                                left: startAnimation ? 0 : -width / 2,
                                child: Container(
                                  width: 350,
                                  child: Text(
                                    "Software Engineer / Mobile and Backend developer",
                                    style: gilroyLight.copyWith(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: Duration(seconds: 1, milliseconds: 900),
                            curve: !startAnimation
                                ? Curves.easeInCubic
                                : Curves.easeOutCubic,
                            bottom: 0,
                            left: startAnimation ? 0 : -width / 2,
                            child: FadeTransition(
                              opacity: portfoilioTextanimation,
                              child: Container(
                                width: 350,
                                child: Text(
                                  "Portfolio",
                                  style: gilroyBold.copyWith(
                                      fontSize: 80, color: appRed),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // child: Container(
                    //   child: Text(
                    //     "Portfolio",
                    //     style: gilroyBold.copyWith(fontSize: 80, color: appRed),
                    //   ),
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
