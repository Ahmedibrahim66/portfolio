import 'package:ahmed_portfolio/Constants/AppColors.dart';
import 'package:ahmed_portfolio/Constants/Fonts.dart';
import 'package:ahmed_portfolio/Pages/AboutMePage/MoreInfo/moreInfo.dart';
import 'package:flutter/material.dart';

class TabletAnimatedSlide extends StatelessWidget {
  const TabletAnimatedSlide({
    Key key,
    @required this.height,
    @required this.width,
    @required this.startAnimation,
    this.image,
    this.number,
    this.title,
    this.subtitle,
    this.haveButton,
    this.buttonText,
    this.sizeTransitionController,
  }) : super(key: key);

  final double height;
  final double width;
  final bool startAnimation;
  final String image;
  final String number;
  final String title;
  final String subtitle;
  final bool haveButton;
  final String buttonText;
  final AnimationController sizeTransitionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height - 200,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //to make the image go larger
                        AnimatedContainer(
                          duration: Duration(seconds: 1, milliseconds: 600),
                          width: 1,
                          curve: Curves.easeInOut,
                          height: startAnimation ? 0 : 150,
                          color: Colors.transparent,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              //to make the image go larger
                              AnimatedContainer(
                                duration:
                                    Duration(seconds: 1, milliseconds: 600),
                                height: 1,
                                curve: Curves.easeInOut,
                                width: startAnimation ? 0 : 150,
                                color: Colors.transparent,
                              ),
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Hero(
                                      tag: title,
                                      child: Container(
                                        child: Image.asset(
                                          image,
                                          fit: BoxFit.cover,
                                          width: width,
                                          height: height,
                                        ),
                                      ),
                                    ),
                                    AnimatedContainer(
                                      duration: Duration(
                                          seconds: 1, milliseconds: 600),
                                      width: startAnimation ? 0 : width,
                                      curve: Curves.ease,
                                      color: appRed,
                                    ),
                                    AnimatedContainer(
                                      duration: Duration(
                                          seconds: 1, milliseconds: 300),
                                      width: startAnimation ? 0 : width,
                                      curve: Curves.ease,
                                      color: lighterBlue,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2, milliseconds: 300),
            curve: !startAnimation ? Curves.easeInCubic : Curves.easeOutCubic,
            bottom: startAnimation ? 100 : -height / 2,
            right: 0,
            child: Text(
              number,
              style: gilroyBold.copyWith(fontSize: 100, color: Colors.white),
            ),
          ),
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
                      height: 110,
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: Duration(seconds: 1, milliseconds: 300),
                            curve: !startAnimation
                                ? Curves.easeInCubic
                                : Curves.easeOutCubic,
                            bottom: 0,
                            left: startAnimation ? 0 : -width / 2,
                            child: Text(
                              title,
                              style: gilroyBold.copyWith(
                                  fontSize: 9.5 *
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01) >
                                          70
                                      ? 70
                                      : 9.5 *
                                          (MediaQuery.of(context).size.width *
                                              0.01),
                                  color: Colors.white),
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
                            duration: Duration(seconds: 1, milliseconds: 600),
                            curve: !startAnimation
                                ? Curves.easeInCubic
                                : Curves.easeOutCubic,
                            bottom: 0,
                            left: startAnimation ? 0 : -width / 2,
                            child: AnimatedContainer(
                              curve: Curves.easeInOutCubic,
                              duration: Duration(milliseconds: 500),
                              height: 4,
                              width: 70,
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
                            duration: Duration(seconds: 1, milliseconds: 600),
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
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
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
                            duration: Duration(seconds: 1, milliseconds: 500),
                            curve: !startAnimation
                                ? Curves.easeInCubic
                                : Curves.easeOutCubic,
                            bottom: 0,
                            left: startAnimation ? 0 : -width / 2,
                            child: Container(
                              width: 350,
                              child: Text(
                                subtitle,
                                style: gilroyLight.copyWith(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    !haveButton
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(seconds: 1),
                                      pageBuilder: (_, __, ___) =>
                                          MoreInfoPage()));
                            },
                            child: Container(
                              height: 50,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  AnimatedPositioned(
                                    duration:
                                        Duration(seconds: 1, milliseconds: 800),
                                    curve: !startAnimation
                                        ? Curves.easeInCubic
                                        : Curves.easeOutCubic,
                                    left: startAnimation ? 0 : -width / 2,
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: appRed),
                                      child: Center(
                                        child: Text(
                                          buttonText,
                                          style: gilroyLight.copyWith(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
