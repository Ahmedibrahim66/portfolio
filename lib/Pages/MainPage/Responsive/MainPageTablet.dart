import 'package:ahmed_portfolio/Constants/Fonts.dart';
import 'package:ahmed_portfolio/Pages/MainPage/bloc/main_page_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainPageTablet extends StatefulWidget {
  final List<Widget> pages;

  const MainPageTablet({Key key, this.pages}) : super(key: key);

  @override
  _MainPageTabletState createState() => _MainPageTabletState();
}

class _MainPageTabletState extends State<MainPageTablet>
    with TickerProviderStateMixin {
  //index of the current page
  int index = 0;

  //mutex on scolling
  //Listner will listen to every scroll touch so we need a mutex
  bool isScolling = false;
  bool isMouseMoving = false;
  //Scolling contollers and listner
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  // moon light animation
  double x = 0.0;
  double y = 0.0;

  //remove blackscreen and show the page
  bool appStarted = true;

  //HomePage Animation Controller Moon/clouds/
  bool homePageStarted = false;

  //mutex function
  mutexOnScrolling(PointerScrollEvent event) async {
    if (event.scrollDelta.dy > 0) {
      if (index < widget.pages.length - 1) {
        setState(() {
          index++;
        });
        print("index is $index");
        BlocProvider.of<MainPageBloc>(context).add(ScrollToIndex(index));
        await Future.delayed(Duration(seconds: 2, milliseconds: 500));
      }
    } else if (event.scrollDelta.dy < 0) {
      if (index > 0) {
        setState(() {
          index--;
        });
        print(" index is $index");
        BlocProvider.of<MainPageBloc>(context).add(ScrollToIndex(index));
        await Future.delayed(Duration(seconds: 2, milliseconds: 500));
      }
    }
    isScolling = false;
  }

  appStartedAnimation() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      appStarted = false;
    });
    fadeInAnimationController.forward();
  }

  //fade animation controller
  AnimationController fadeInAnimationController;

  //socail media icons animation controller
  AnimationController _facebookIconController;
  AnimationController _linkedIconController;
  AnimationController _youtubeIconController;
  AnimationController _instagramIconController;
  AnimationController _githubIconController;

  @override
  void initState() {
    fadeInAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 500),
      reverseDuration: Duration(seconds: 0, milliseconds: 700),
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocListener<MainPageBloc, MainPageState>(
        listener: (context, state) async {
      if (state is ShowInitialAnimation) {
        //show start up animation we should await this 2 seconds delay and then start the animation
        await appStartedAnimation();
        BlocProvider.of<MainPageBloc>(context).add(ScrollToIndex(0));
      }

      if (state is ShowHomePage) {
        itemScrollController.scrollTo(
            index: 0,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCubic);

        fadeInAnimationController.forward();

        setState(() {
          homePageStarted = true;
        });
      }

      if (state is ShowAboutMePage) {
        itemScrollController.scrollTo(
            index: 1,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCubic);

        fadeInAnimationController.reverse();

        setState(() {
          homePageStarted = false;
        });
      }

      if (state is ShowAbuEishehPage) {
        itemScrollController.scrollTo(
            index: 2,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCubic);
      }

      if (state is ShowSpartanFitnessPage) {
        itemScrollController.scrollTo(
            index: 3,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCubic);
      }

      if (state is ShowGetInTouchPage) {
        itemScrollController.scrollTo(
            index: 4,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCubic);
      }
    }, child:
            BlocBuilder<MainPageBloc, MainPageState>(builder: (context, state) {
      if (state is MainPageInitial) {
        BlocProvider.of<MainPageBloc>(context).add(StartInitialAnimation());
      }
      return Scaffold(
        body: Stack(
          children: [
            //Background color
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff082141), Color(0xff010A16)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),

            // //App bar icons
            // this widget contain the icons but not the mouse area
            appBarIcons(),

            //MoonLight background
            moonLightWidget(height, width),

            //Main Widgets Switcher Screens

            //Scroll and mouse location detecors
            ConstrainedBox(
              constraints: BoxConstraints.loose(Size.infinite),
              child: Listener(
                onPointerSignal: (event) {
                  if (event is PointerScrollEvent) {
                    // do something when scrolled
                    if (!isScolling) {
                      isScolling = true;
                      mutexOnScrolling(event);
                    }
                  }
                },
                child: MouseRegion(
                  onHover: (detail) {
                    if (!isMouseMoving) {
                      isMouseMoving = true;
                      _updateLocation(detail);
                    }
                  },
                  child: Container(
                    child: Container(
                      height: height,
                      width: width,
                      child: ScrollablePositionedList.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.pages.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 20, top: 100, bottom: 100),
                          child: widget.pages[index],
                        ),
                        itemScrollController: itemScrollController,
                        itemPositionsListener: itemPositionsListener,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //left Drawer
            bottomDrawer(height, width),

            //Start of the page show black container
            Positioned(
              top: 0,
              left: 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: appStarted ? height : 0,
                width: width,
                color: Colors.black,
              ),
            ),

            //AppBar at the top
            appBar(),

            //App bar
            appBarIconsMouseRegion(),
          ],
        ),
      );
    }));
  }

  AnimatedPositioned moonLightWidget(double height, double width) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 150),
      curve: Curves.linear,
      //bottom: 10 * y / height,
      // left: 400 + 10 * x / height,
      left: height / 2.5 + (x * 20 / width),
      top: 0 + (y * 30 / height),
      child: Container(
        height: height,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Opacity(
                opacity: 0.5,
                child: Image.asset(
                  "Images/MainPage/moonlight.png",
                  fit: BoxFit.fitHeight,
                  height: height,
                ),
              ),
              //Clouds back 2 widget
              AnimatedPositioned(
                duration: Duration(seconds: 1, milliseconds: 500),
                right: !homePageStarted
                    ? -width
                    : index == 0
                        ? (height / 4 - 120)
                        : -width,
                top: height / 10 + (y * 30 / height),
                curve: Curves.easeInOutCubic,
                child: FadeTransition(
                  opacity: fadeInAnimationController,
                  child: Container(
                    height: 160,
                    child: Image.asset(
                      "Images/HomePage/ColudsBack2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              //Clouds back 1 widget
              AnimatedPositioned(
                duration: Duration(seconds: 1, milliseconds: 500),
                right: !homePageStarted
                    ? -width
                    : index == 0
                        ? (height / 4 + 120)
                        : -width,
                top: height / 5 + (y * 70 / height),
                curve: Curves.easeInOutCubic,
                child: FadeTransition(
                  opacity: fadeInAnimationController,
                  child: Container(
                    height: 150,
                    child: Image.asset(
                      "Images/HomePage/CloudsBack1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              //Moon widget
              AnimatedPositioned(
                duration: Duration(seconds: 1, milliseconds: 500),
                curve: Curves.easeInOutCubic,
                right: !homePageStarted
                    ? -width
                    : index == 0
                        ? height / 4 + 30
                        : -width,
                child: FadeTransition(
                  opacity: fadeInAnimationController,
                  child: Container(
                    height: height / 2.4,
                    child: Image.asset(
                      "Images/HomePage/moon.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              //Clouds front 1 widget
              AnimatedPositioned(
                duration: Duration(seconds: 1, milliseconds: 500),
                right: !homePageStarted
                    ? -width
                    : index == 0
                        ? (height / 4 - 100)
                        : -width,
                bottom: (height / 3) + (y * 40 / height),
                curve: Curves.easeInOutCubic,
                child: FadeTransition(
                  opacity: fadeInAnimationController,
                  child: Container(
                    height: 180,
                    child: Image.asset(
                      "Images/HomePage/CloudsFront2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              //Clouds font 2 widget
              AnimatedPositioned(
                duration: Duration(seconds: 1, milliseconds: 500),
                right: !homePageStarted
                    ? -width
                    : index == 0
                        ? (height / 4 + 150)
                        : -width,

                // (((OldValue - OldMin) * (NewMax - NewMin)) / (OldMax - OldMin)) + NewMin
                bottom: (height / 5) + (y * 40 / height),
                curve: Curves.easeInOutCubic,
                child: FadeTransition(
                  opacity: fadeInAnimationController,
                  child: Container(
                    height: 120,
                    child: Image.asset(
                      "Images/HomePage/CloudsFront1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateLocation(PointerEvent details) async {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });

    await Future.delayed(Duration(milliseconds: 100));
    isMouseMoving = false;
  }

  Widget bottomDrawer(double height, double width) {
    return Positioned(
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        child: Container(
          height: 240,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutCubic,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    top: index != 0 ? 500 : 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: Text("SCROLL DOWN",
                                style: gilroyMedium.copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 3)),
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
                  ),
                ],
              )),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                              itemCount: widget.pages.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                return Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<MainPageBloc>(context)
                                            .add(ScrollToIndex(i));

                                        setState(() {
                                          index = i;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        curve: Curves.easeInOutCubic,
                                        duration: Duration(milliseconds: 500),
                                        width: 3,
                                        height: index == i ? 50 : 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  )),
              Expanded(child: Container()),
            ],
          ),
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
                style: gilroyMedium.copyWith(fontSize: 24, color: Colors.white),
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
                      child: Lottie.asset('Images/AnimatedIcons/facebook.json',
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
                      child: Lottie.asset('Images/AnimatedIcons/linkedIn.json',
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
                      child: Lottie.asset('Images/AnimatedIcons/instagram.json',
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
                      child: Lottie.asset('Images/AnimatedIcons/youtube.json',
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
                      child: Lottie.asset('Images/AnimatedIcons/github.json',
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
                      onEnter: (detail) {
                        _facebookIconController.animateTo(0.9).whenComplete(
                            () => _facebookIconController.reverse());
                      },
                      onExit: (detail) {
                        _facebookIconController.animateTo(0);
                      },
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
                      onEnter: (detail) {
                        _linkedIconController.forward().whenComplete(
                            () => _linkedIconController.reverse());
                      },
                      onExit: (detail) {
                        _linkedIconController.animateTo(0);
                      },
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
                      onEnter: (detail) {
                        _instagramIconController.forward().whenComplete(
                            () => _instagramIconController.reverse());
                      },
                      onExit: (detail) {
                        _instagramIconController.animateTo(0);
                      },
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
                      onEnter: (detail) {
                        _youtubeIconController.forward().whenComplete(
                            () => _youtubeIconController.reverse());
                      },
                      onExit: (detail) {
                        _youtubeIconController.animateTo(0);
                      },
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
                      onEnter: (detail) {
                        _githubIconController.forward().whenComplete(
                            () => _githubIconController.reverse());
                      },
                      onExit: (detail) {
                        _githubIconController.animateTo(0);
                      },
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
