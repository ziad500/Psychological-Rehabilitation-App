import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:phsyo/modules/login_screen/login_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/constraints.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String? title;
  final String? text1;
  final String? text2;
  final String? button;
  final String? image;

  BoardingModel(
      {required this.title,
      required this.text1,
      required this.text2,
      required this.button,
      required this.image});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'icons/onboarding1.png',
        text1: 'find the best qualified therapist',
        text2: 'for your need.',
        title: 'Therapy whereever you are',
        button: 'NEXT'),
    BoardingModel(
        image: 'icons/onboarding2.png',
        text1: 'view your therapist\'s availability',
        text2: 'and book according to your routine',
        title: 'Easy appointment scheduling',
        button: 'NEXT'),
    BoardingModel(
        image: 'icons/onboarding3.png',
        text1: '',
        text2: '',
        title: 'You are not alone in this',
        button: 'LET\'S GET STARTED'),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            InkWell(
              onTap: () {
                navigateTo(context, LoginScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Row(
                  children: [
                    Text(
                      'SKIP',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 18,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxHeight >= 600.0) {
              return BigScreen(context);
            } else {
              return SmallScreen(context);
            }
          },
        ));
  }

  Widget BigScreen(context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Expanded(
                child: PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: boardController,
              itemBuilder: (context, index) =>
                  buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
            )),
            SizedBox(
              height: 10.h,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: boardController,
                        count: boarding.length,
                        effect: ExpandingDotsEffect(
                            dotHeight: 10.0,
                            dotColor: Colors.grey,
                            expansionFactor: 4,
                            dotWidth: 10.0,
                            spacing: 5.0,
                            activeDotColor: defaultColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      );

  Widget SmallScreen(context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Expanded(
                child: PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: boardController,
              itemBuilder: (context, index) =>
                  buildBoardingItemSmall(boarding[index]),
              itemCount: boarding.length,
            )),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: boardController,
                      count: boarding.length,
                      effect: ExpandingDotsEffect(
                          dotHeight: 10.0,
                          dotColor: Colors.grey,
                          expansionFactor: 4,
                          dotWidth: 10.0,
                          spacing: 5.0,
                          activeDotColor: defaultColor),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );

  Widget buildBoardingItem(BoardingModel model) => ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              SizedBox(
                height: 38.h,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Center(
                            child: Image(
                              image: const AssetImage(
                                'icons/Ellipse.png',
                              ),
                              width: 300,
                            ),
                          ),
                          Center(
                            child: Image(
                              image: AssetImage(
                                '${model.image}',
                              ),
                              height: 290,
                              width: 270,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 30.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 13.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 130,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    '${model.title}',
                                    style: TextStyle(
                                        backgroundColor: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${model.text1}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.0),
                                  ),
                                  Text(
                                    '${model.text2}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(top: 50.0),
                              child: Center(
                                child: defaultButton(
                                  function: () {
                                    if (isLast == true) {
                                      navigateTo(context, LoginScreen());
                                    } else {
                                      boardController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 750),
                                          curve: Curves.fastLinearToSlowEaseIn);
                                    }
                                  },
                                  text: '${model.button}',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  Widget buildBoardingItemSmall(BoardingModel model) => Row(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 38.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Center(
                                  child: Image(
                                    image: const AssetImage(
                                      'icons/Ellipse.png',
                                    ),
                                    width: 240,
                                  ),
                                ),
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      '${model.image}',
                                    ),
                                    height: 230,
                                    width: 210,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  top: 13.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 110,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '${model.title}',
                                          style: TextStyle(
                                              backgroundColor: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${model.text1}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                        Text(
                                          '${model.text2}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 80.0),
                                    child: Center(
                                      child: defaultButton(
                                        width: 50.w,
                                        textsize: 10.0,
                                        verticalpadding: 10.0,
                                        function: () {
                                          if (isLast == true) {
                                            navigateTo(context, LoginScreen());
                                          } else {
                                            boardController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 750),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn);
                                          }
                                        },
                                        text: '${model.button}',
                                      ),
                                    ),
                                  )
                                ],
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
        ],
      );
}
