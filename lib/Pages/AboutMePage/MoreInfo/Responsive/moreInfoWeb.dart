import 'package:ahmed_portfolio/Constants/AppColors.dart';
import 'package:ahmed_portfolio/Constants/AppText.dart';
import 'package:ahmed_portfolio/Constants/Fonts.dart';
import 'package:ahmed_portfolio/Pages/MainPage/bloc/main_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeMoreInfoWeb extends StatefulWidget {
  @override
  _AboutMeMoreInfoWebState createState() => _AboutMeMoreInfoWebState();
}

class _AboutMeMoreInfoWebState extends State<AboutMeMoreInfoWeb>
    with TickerProviderStateMixin {
  //Back arrow controller
  AnimationController _backArrowController;

  //socail media icons animation controller
  AnimationController _facebookIconController;
  AnimationController _linkedIconController;
  AnimationController _youtubeIconController;
  AnimationController _instagramIconController;
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

    _facebookIconController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );

    _linkedIconController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _youtubeIconController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _instagramIconController = AnimationController(
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
    print("height of screen is $height");

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
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(),
                              ),
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
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(100),
                            child: Container(
                              height: height - 200,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: Hero(
                                      tag: "About MeTitleWeb",
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
                                            Container(
                                              height: 110,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    bottom: 0,
                                                    left: 0,
                                                    child: Text(
                                                      "About Me",
                                                      style:
                                                          gilroyBold.copyWith(
                                                              fontSize: 100,
                                                              color:
                                                                  Colors.white),
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
                                                  Positioned(
                                                    bottom: 0,
                                                    left: 0,
                                                    child: AnimatedContainer(
                                                      curve:
                                                          Curves.easeInOutCubic,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      height: 4,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
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
                                                  Positioned(
                                                    bottom: 0,
                                                    left: 0,
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 50,
                                                        ),
                                                        Container(
                                                          height: 4,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
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
                                                  Positioned(
                                                    bottom: 0,
                                                    left: 0,
                                                    child: Container(
                                                      width: 350,
                                                      child: Text(
                                                        "I love Programming, Design and some Gaming",
                                                        style: gilroyLight
                                                            .copyWith(
                                                                fontSize: 20,
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    bodyWidget(width)
                  ],
                ),
              ),
              // //App bar icons
              // this widget contain the icons but not the mouse area
              Hero(tag: "AppBarIcons", child: appBarIcons()),

              //left Drawer
              leftDrawer(height),

              //AppBar at the top
              appBar(),

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
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
                      "01",
                      style: gilroyBold.copyWith(color: appRed, fontSize: 50),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "WHO I AM",
                      style: gilroyBold.copyWith(
                          color: Colors.black, fontSize: 50),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahmed Ali Ibrahim",
                      style: gilroyBold.copyWith(
                        color: Colors.black,
                        fontSize: 35,
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
              )),
            ],
          ),
          SizedBox(
            height: 200,
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
                      style: gilroyBold.copyWith(color: appRed, fontSize: 50),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Education",
                      style: gilroyBold.copyWith(
                          color: Colors.black, fontSize: 50),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 40, left: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ramallah Friends School",
                              style: gilroyBold.copyWith(
                                color: Colors.black,
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              "2016 Graduate",
                              style: gilroyBold.copyWith(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Text(
                          "Received my International Baccalaureate degree in 2016",
                          style: gilroyLight.copyWith(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 18,
                              height: 2),
                          textAlign: TextAlign.justify,
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
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Birzeit University",
                              style: gilroyBold.copyWith(
                                color: Colors.black,
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              "Sep 2016 - Jun 2021 ",
                              style: gilroyBold.copyWith(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Text(
                          "Bachelor degree in Computer Engineering",
                          style: gilroyLight.copyWith(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 18,
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
                  )),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 200,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
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
                      style: gilroyBold.copyWith(color: appRed, fontSize: 50),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "WORK EXPERIENCE",
                      style: gilroyBold.copyWith(
                          color: Colors.black, fontSize: 50),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Exalt Technologies",
                          style: gilroyBold.copyWith(
                            color: Colors.black,
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          "October 2020 - Present",
                          style: gilroyBold.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Backend Developer - Frontline-pcb Team",
                      style: gilroyLight.copyWith(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 18,
                          height: 2),
                      textAlign: TextAlign.justify,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Image.asset("Images/AboutMe/EXALT.png",
                              width: double.infinity, fit: BoxFit.fitWidth),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Image.asset("Images/AboutMe/frontLine.jpeg",
                                width: double.infinity, fit: BoxFit.fitWidth),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
          SizedBox(
            height: 200,
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
                      style: gilroyBold.copyWith(color: appRed, fontSize: 50),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "TECHNICAL SKILLS",
                      style: gilroyBold.copyWith(
                          color: Colors.black, fontSize: 50),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 100),
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
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                  )),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 200,
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
          height: 50,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              Row(
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
            ],
          ),
        ),
      ],
    );
  }

  Padding leftDrawer(double height) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
      ),
      child: Container(
        width: 50,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    _scrollController.animateTo(0,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutCubic);
                    await Future.delayed(Duration(seconds: 1));
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
                            height: 40,
                            controller: _backArrowController,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(),
                ),
              ],
            )),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Text("SCROLL DOWN",
                            style: gilroyMedium.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 5)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
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
              ],
            )),
          ],
        ),
      ),
    );
  }

  Padding appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          height: 68,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ahmed Ibrahim",
                style: gilroyMedium.copyWith(
                    fontSize: 24,
                    color: isScrolledDetector ? Colors.black : Colors.white),
              ),
            ],
          )),
    );
  }

  Padding appBarIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          height: 68,
          width: double.infinity,
          color: isScrolledDetector ? Colors.white : Colors.transparent,
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
                        _facebookIconController.animateTo(0.9).whenComplete(
                            () => _facebookIconController.reverse());
                      },
                      onExit: (detail) {
                        _facebookIconController.animateTo(0);
                      },
                      child: Lottie.asset(
                          isScrolledDetector
                              ? 'Images/AnimatedIcons/facebookBlack.json'
                              : 'Images/AnimatedIcons/facebook.json',
                          height: 24,
                          controller: _facebookIconController,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 30),
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
                      child: Lottie.asset(
                          isScrolledDetector
                              ? 'Images/AnimatedIcons/linkedinBlack.json'
                              : 'Images/AnimatedIcons/linkedIn.json',
                          height: 24,
                          controller: _linkedIconController,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 30),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(40, 40)),
                    child: MouseRegion(
                      onEnter: (detail) {
                        _instagramIconController.forward().whenComplete(
                            () => _instagramIconController.reverse());
                      },
                      onExit: (detail) {
                        _instagramIconController.animateTo(0);
                      },
                      child: Lottie.asset(
                          isScrolledDetector
                              ? 'Images/AnimatedIcons/instagramBlack.json'
                              : 'Images/AnimatedIcons/instagram.json',
                          height: 24,
                          controller: _instagramIconController,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 30),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(40, 40)),
                    child: MouseRegion(
                      onEnter: (detail) {
                        _youtubeIconController.forward().whenComplete(
                            () => _youtubeIconController.reverse());
                      },
                      onExit: (detail) {
                        _youtubeIconController.animateTo(0);
                      },
                      child: Lottie.asset(
                          isScrolledDetector
                              ? 'Images/AnimatedIcons/youtubeBlack.json'
                              : 'Images/AnimatedIcons/youtube.json',
                          height: 24,
                          controller: _youtubeIconController,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 30),
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
                      child: Lottie.asset(
                          isScrolledDetector
                              ? 'Images/AnimatedIcons/githubBlack.json'
                              : 'Images/AnimatedIcons/github.json',
                          height: 24,
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
                      cursor: SystemMouseCursors.click,

                      onEnter: (detail) {
                        _facebookIconController.animateTo(0.9).whenComplete(
                            () => _facebookIconController.reverse());
                      },
                      onExit: (detail) {
                        _facebookIconController.animateTo(0);
                      },
                      child: GestureDetector(
                        onTap: () {
                          launch("https://www.facebook.com/ahmedibrahim2141/");
                        },
                      ),
                      // child: Lottie.asset('Images/AnimatedIcons/facebook.json',
                      //     height: 24,
                      //     controller: _facebookIconController,
                      //     fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 30),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(40, 40)),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,

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
                      // child: Lottie.asset('Images/AnimatedIcons/linkedIn.json',
                      //     height: 24,
                      //     controller: _linkedIconController,
                      //     fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 30),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(40, 40)),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,

                      onEnter: (detail) {
                        _instagramIconController.forward().whenComplete(
                            () => _instagramIconController.reverse());
                      },
                      onExit: (detail) {
                        _instagramIconController.animateTo(0);
                      },
                      child: GestureDetector(
                        onTap: () {
                          launch("https://www.instagram.com/ahmedibrahim7070/");
                        },
                      ),
                      // child: Lottie.asset('Images/AnimatedIcons/instagram.json',
                      //     height: 24,
                      //     controller: _instagramIconController,
                      //     fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 30),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(40, 40)),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,

                      onEnter: (detail) {
                        _youtubeIconController.forward().whenComplete(
                            () => _youtubeIconController.reverse());
                      },
                      onExit: (detail) {
                        _youtubeIconController.animateTo(0);
                      },
                      child: GestureDetector(
                        onTap: () {
                          launch(
                              "https://www.youtube.com/channel/UCSci5WV-cTC7c-dJjYxqOYQ");
                        },
                      ),
                      // child: Lottie.asset('Images/AnimatedIcons/youtube.json',
                      //     height: 24,
                      //     controller: _youtubeIconController,
                      //     fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 30),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(40, 40)),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,

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
                      // child: Lottie.asset('Images/AnimatedIcons/github.json',
                      //     height: 24,
                      //     controller: _githubIconController,
                      //     fit: BoxFit.cover),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
