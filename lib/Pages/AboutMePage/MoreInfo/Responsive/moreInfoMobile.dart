import 'package:ahmed_portfolio/Constants/AppColors.dart';
import 'package:ahmed_portfolio/Constants/AppText.dart';
import 'package:ahmed_portfolio/Constants/Fonts.dart';
import 'package:ahmed_portfolio/Pages/MainPage/bloc/main_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeMoreInfoMobile extends StatefulWidget {
  @override
  _AboutMeMoreInfoMobileState createState() => _AboutMeMoreInfoMobileState();
}

class _AboutMeMoreInfoMobileState extends State<AboutMeMoreInfoMobile>
    with TickerProviderStateMixin {
  //Back arrow controller
  AnimationController _backArrowController;

  //socail media icons animation controller
  AnimationController _linkedIconController;
  AnimationController _githubIconController;

  ScrollController _scrollController = new ScrollController();

  //bool to controller appbar icons and text and back button color
  //when user scrolled whole page make icons black
  bool isScrolledDetector = false;

  @override
  void initState() {
    _backArrowController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    _linkedIconController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _githubIconController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _backArrowController.animateTo(0.85);

    //to detect where the scrolling position is in the page
    _scrollController.addListener(() {
      if (_scrollController.offset >
          (_scrollController.position.viewportDimension)) {
        setState(() {
          isScrolledDetector = true;
        });
      } else {
        setState(() {
          isScrolledDetector = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocListener<MainPageBloc, MainPageState>(
          listener: (context, state) {},
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Container(
                      height: height,
                      width: width,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Hero(
                                  tag: "About Me",
                                  child: Container(
                                    child: Image.asset(
                                      "Images/AboutMe/aboutme.png",
                                      fit: BoxFit.cover,
                                      width: width,
                                      height: height,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Expanded(child: Container()),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: Expanded(
                                          child: Hero(
                                            tag: "About MeTitleMobile",
                                            child: Material(
                                              type: MaterialType
                                                  .transparency, // material widget and this attribute are used for the text transition between the two pages

                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          bottom: 0,
                                                          left: 0,
                                                          child: Text(
                                                            "About Me",
                                                            style: gilroyBold
                                                                .copyWith(
                                                                    fontSize:
                                                                        40,
                                                                    color: Colors
                                                                        .white),
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
                                                        Positioned(
                                                          bottom: 0,
                                                          left: 0,
                                                          child:
                                                              AnimatedContainer(
                                                            curve: Curves
                                                                .easeInOutCubic,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            height: 2,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
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
                                                        Positioned(
                                                          bottom: 0,
                                                          left: 0,
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 30,
                                                              ),
                                                              AnimatedContainer(
                                                                curve: Curves
                                                                    .easeOutCubic,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                height: 2,
                                                                width: 60,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    color:
                                                                        appRed),
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
                                                        Positioned(
                                                          bottom: 0,
                                                          left: 0,
                                                          child: Container(
                                                            width: width - 60,
                                                            child: Text(
                                                              "I love Programming, Design and some Gaming",
                                                              style: gilroyLight
                                                                  .copyWith(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 70),
                                                ],
                                              ),
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
                        ],
                      ),
                    ),
                    bodyWidget(width)
                  ],
                ),
              ),

              scrollDownText(),

              // //App bar icons
              // this widget contain the icons but not the mouse area
              Hero(tag: "AppBarIcons", child: appBarIcons()),

              //left Drawer
              leftDrawer(height),

              //AppBar at the top
              //appBar(),

              //App bar
              appBarIconsMouseRegion(),
            ],
          ),
        ));
  }

  Container bodyWidget(double width) {
    return Container(
      width: width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 2,
                    color: Colors.black,
                    width: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "01",
                    style: gilroyBold.copyWith(color: appRed, fontSize: 30),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "WHO I AM",
                    style:
                        gilroyBold.copyWith(color: Colors.black, fontSize: 28),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Ahmed Ali Ibrahim",
                      style: gilroyBold.copyWith(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      aboutMeDescription,
                      style: gilroyLight.copyWith(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 18,
                          height: 2),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 40),
                    Image.asset("Images/AboutMe/profilePic.jpeg",
                        width: double.infinity, fit: BoxFit.fitWidth),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 2,
                      color: Colors.black,
                      width: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "02",
                      style: gilroyBold.copyWith(color: appRed, fontSize: 30),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Education",
                      style: gilroyBold.copyWith(
                          color: Colors.black, fontSize: 28),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ramallah Friends School",
                              style: gilroyBold.copyWith(
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "2016 Graduate",
                              style: gilroyBold.copyWith(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Received my International Baccalaureate degree in 2016",
                          style: gilroyLight.copyWith(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 16,
                              height: 2),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: Colors.blue,
                          child: Image.asset(
                            "Images/AboutMe/rfs.jpeg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Birzeit University",
                              style: gilroyBold.copyWith(
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "Sep 2016 - Jun 2021 ",
                              style: gilroyBold.copyWith(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Bachelor degree in Computer Engineering",
                          style: gilroyLight.copyWith(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 16,
                              height: 2),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: Colors.blue,
                          child: Image.asset(
                            "Images/AboutMe/birzeit.jpeg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 2,
                      color: Colors.black,
                      width: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "03",
                      style: gilroyBold.copyWith(color: appRed, fontSize: 30),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "WORK EXPERIENCE",
                      style: gilroyBold.copyWith(
                          color: Colors.black, fontSize: 28),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Exalt Technologies",
                          style: gilroyBold.copyWith(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "October 2020 - Present",
                          style: gilroyBold.copyWith(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Backend Developer - Frontline-pcb Team",
                      style: gilroyLight.copyWith(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 16,
                          height: 2),
                      textAlign: TextAlign.left,
                    ),
                    Image.asset("Images/AboutMe/EXALT.png",
                        height: 100, fit: BoxFit.scaleDown),
                    Image.asset(
                      "Images/AboutMe/frontLine.jpeg",
                      height: 70,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 2,
                      color: Colors.black,
                      width: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "04",
                      style: gilroyBold.copyWith(color: appRed, fontSize: 30),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "TECHNICAL SKILLS",
                      style: gilroyBold.copyWith(
                          color: Colors.black, fontSize: 28),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        technicalSkillsRow(
                            name: "Flutter",
                            dateExperience: "1.5 Year",
                            logoPath: 'Images/AboutMe/flutter.png',
                            percentageExperince: 80),
                        SizedBox(height: 40),
                        technicalSkillsRow(
                            name: "Android",
                            dateExperience: "2 Year",
                            logoPath: 'Images/AboutMe/android.png',
                            percentageExperince: 60),
                        SizedBox(height: 40),
                        technicalSkillsRow(
                            name: "Git",
                            dateExperience: "",
                            logoPath: 'Images/AboutMe/git.png',
                            percentageExperince: 70),
                        SizedBox(height: 40),
                        technicalSkillsRow(
                            name: "Spring Boot",
                            dateExperience: "1 Year",
                            logoPath: 'Images/AboutMe/springboot.png',
                            percentageExperince: 70),
                        SizedBox(height: 40),
                        technicalSkillsRow(
                            name: "Firebase",
                            dateExperience: "1.5 Year",
                            logoPath: 'Images/AboutMe/firebase.png',
                            percentageExperince: 50),
                        SizedBox(height: 40),
                        technicalSkillsRow(
                            name: "postgres",
                            dateExperience: "",
                            logoPath: 'Images/AboutMe/postgres.png',
                            percentageExperince: 50),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget technicalSkillsRow(
      {String logoPath,
      String name,
      String dateExperience,
      int percentageExperince}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          logoPath,
          width: 40,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: gilroyBold.copyWith(
                    color: Colors.black, fontSize: 24, height: 2),
              ),
              SizedBox(width: 20),
              Text(
                dateExperience,
                style: gilroyLight.copyWith(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 16,
                    height: 2),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget scrollDownText() {
    return Column(
      children: [
        Expanded(flex: 4, child: Container()),
        Expanded(
            child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutCubic,
              right: 0,
              bottom: 0,
              left: 0,
              top: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: isScrolledDetector
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: Text("SCROLL DOWN",
                                style: gilroyMedium.copyWith(
                                    color: isScrolledDetector
                                        ? Colors.transparent
                                        : Colors.white,
                                    fontSize: 10,
                                    letterSpacing: 3)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Container(
                                width: 2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ],
        )),
      ],
    );
  }

  Padding leftDrawer(double height) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Container(
        width: 50,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async {
                _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic);
                await Future.delayed(Duration(milliseconds: 500));
                BlocProvider.of<MainPageBloc>(context)
                    .add(NavigateToHomePage());
                _backArrowController.animateTo(0);
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Lottie.asset(
                        isScrolledDetector
                            ? 'Images/MoreInfoPage/backArrowBlack.json'
                            : 'Images/MoreInfoPage/backArrow.json',
                        height: 30,
                        controller: _backArrowController,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBarIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          height: 68,
          color: isScrolledDetector ? Colors.white : Colors.transparent,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(30, 30)),
                    child: MouseRegion(
                      onEnter: (detail) {
                        _linkedIconController.forward().whenComplete(
                            () => _linkedIconController.reverse());
                      },
                      onExit: (detail) {
                        _linkedIconController.animateTo(0);
                      },
                      child: Lottie.asset(
                          isScrolledDetector
                              ? 'Images/AnimatedIcons/linkedinBlack.json'
                              : 'Images/AnimatedIcons/linkedIn.json',
                          height: 24,
                          controller: _linkedIconController,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 15),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(30, 30)),
                    child: MouseRegion(
                      onEnter: (detail) {
                        _githubIconController.forward().whenComplete(
                            () => _githubIconController.reverse());
                      },
                      onExit: (detail) {
                        _githubIconController.animateTo(0);
                      },
                      child: Lottie.asset(
                          isScrolledDetector
                              ? 'Images/AnimatedIcons/githubBlack.json'
                              : 'Images/AnimatedIcons/github.json',
                          height: 30,
                          controller: _githubIconController,
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  Padding appBarIconsMouseRegion() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          height: 68,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(40, 40)),
                    child: MouseRegion(
                      onEnter: (detail) {
                        _linkedIconController.forward().whenComplete(
                            () => _linkedIconController.reverse());
                      },
                      onExit: (detail) {
                        _linkedIconController.animateTo(0);
                      },
                      child: GestureDetector(
                        onTap: () {
                          launch(
                              "https://www.linkedin.com/in/ahmed-ibrahim-51606b18a/");
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(40, 40)),
                    child: MouseRegion(
                      onEnter: (detail) {
                        _githubIconController.forward().whenComplete(
                            () => _githubIconController.reverse());
                      },
                      onExit: (detail) {
                        _githubIconController.animateTo(0);
                      },
                      child: GestureDetector(
                        onTap: () {
                          launch("https://github.com/Ahmedibrahim66");
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
