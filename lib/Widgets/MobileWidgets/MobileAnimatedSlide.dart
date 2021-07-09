import 'package:ahmed_portfolio/Constants/AppColors.dart';
import 'package:ahmed_portfolio/Constants/Fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileAnimatedSlide extends StatelessWidget {
  const MobileAnimatedSlide({
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
    this.onTap,
    this.sizeTransitionController,
    this.isProject,
    this.appStore,
    this.playStore,
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
  final Function onTap;
  final bool isProject;
  final String appStore;
  final String playStore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height - 200,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
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
              Expanded(child: Container()),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Hero(
                  tag: "${title}TitleMobile",
                  child: Material(
                    type: MaterialType
                        .transparency, // material widget and this attribute are used for the text transition between the two pages
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
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
                                  title,
                                  style: gilroyBold.copyWith(
                                      fontSize: 40, color: Colors.white),
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
                          height: 5,
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
                        SizedBox(height: 10),
                        Container(
                          height: 75,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration:
                                    Duration(seconds: 1, milliseconds: 500),
                                curve: !startAnimation
                                    ? Curves.easeInCubic
                                    : Curves.easeOutCubic,
                                bottom: 0,
                                left: startAnimation ? 0 : -width / 2,
                                child: haveButton
                                    ? Container(
                                        width: width - 60,
                                        child: Text(
                                          subtitle,
                                          style: gilroyLight.copyWith(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          Clipboard.setData(new ClipboardData(
                                                  text:
                                                      "ahmedibrahimrip@gmail.com"))
                                              .then((_) {
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Email address copied to clipboard")));
                                          });
                                        },
                                        child: Container(
                                          width: 350,
                                          child: Text(
                                            subtitle,
                                            style: gilroyLight.copyWith(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        !haveButton
                            ? Container()
                            : isProject
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          launch(playStore);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: appRed),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                                "Images/others/android.png"),
                                          )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          launch(appStore);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: appRed),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                                "Images/others/apple.png"),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(
                                    height: 40,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        AnimatedPositioned(
                                          duration: Duration(
                                              seconds: 1, milliseconds: 800),
                                          curve: !startAnimation
                                              ? Curves.easeInCubic
                                              : Curves.easeOutCubic,
                                          left: startAnimation ? 0 : -width / 2,
                                          child: GestureDetector(
                                            onTap: onTap,
                                            child: Container(
                                              height: 40,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: appRed),
                                              child: Center(
                                                child: Text(
                                                  buttonText,
                                                  style: gilroyLight.copyWith(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
