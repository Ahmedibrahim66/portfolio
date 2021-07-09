import 'package:ahmed_portfolio/Constants/AppColors.dart';
import 'package:ahmed_portfolio/Constants/Fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class WebAnimatedSlide extends StatelessWidget {
  const WebAnimatedSlide({
    Key key,
    @required this.height,
    @required this.width,
    @required this.startAnimation,
    this.onTap,
    this.image,
    this.number,
    this.title,
    this.subtitle,
    this.haveButton,
    this.buttonText,
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
          Row(
            children: [
              Expanded(child: Container()),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
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
                child: Hero(
                  tag: "${title}TitleWeb",
                  child: Material(
                    type: MaterialType
                        .transparency, // material widget and this attribute are used for the text transition between the two pages
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
                                      fontSize: 100, color: Colors.white),
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
                                    Duration(seconds: 1, milliseconds: 500),
                                curve: !startAnimation
                                    ? Curves.easeInCubic
                                    : Curves.easeOutCubic,
                                bottom: 0,
                                left: startAnimation ? 0 : -width / 2,
                                child: haveButton
                                    ? Container(
                                        width: 350,
                                        child: Text(
                                          subtitle,
                                          style: gilroyLight.copyWith(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      )
                                    : MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        !haveButton
                            ? Container()
                            : isProject
                                ? Container(
                                    child: Row(
                                      children: [
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
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
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                    "Images/others/android.png"),
                                              )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
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
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                    "Images/others/apple.png"),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: onTap,
                                      child: Container(
                                        height: 50,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            AnimatedPositioned(
                                              duration: Duration(
                                                  seconds: 1,
                                                  milliseconds: 800),
                                              curve: !startAnimation
                                                  ? Curves.easeInCubic
                                                  : Curves.easeOutCubic,
                                              left: startAnimation
                                                  ? 0
                                                  : -width / 2,
                                              child: Container(
                                                height: 50,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
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
                                  ),
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
