import 'package:flutter/material.dart';
import 'package:phsyo/modules/login_screen/login_screen.dart';
import 'package:phsyo/styles/colors.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';
import '../../shared/network/cashe_helper.dart';

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
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardcontroller = PageController();

  List<BoardingModel> Boarding = [
    BoardingModel(
        image: 'icons/Group7957.png',
        text1: 'find the best qualified therapist',
        text2: 'for your need.',
        title: 'Therapy whereever you are',
        button: 'NEXT'),
    BoardingModel(
        image: 'icons/Group7958.png',
        text1: 'view your theapist\'s availability ',
        text2: 'and book according to your routine',
        title: 'Easy appointment scheduling',
        button: 'NEXT'),
    BoardingModel(
        image: 'icons/Group7959.png',
        text1: 'We are here for you',
        text2: '',
        title: 'You are not alone in this',
        button: 'LET\'S GET STARTED'),
  ];
  bool isLast = false;

  void submit() {
    CasheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value == true) navigateAndFinish(context, LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            TextButton(
                onPressed: () {
                  submit();
                },
                child: const Text(
                  'SKIP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: boardcontroller,
                  scrollDirection: Axis.horizontal,
                  allowImplicitScrolling: true,
                  onPageChanged: (int index) {
                    if (index == Boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoardingItem(Boarding[index]),
                  itemCount: Boarding.length,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardcontroller,
                    count: Boarding.length,
                    effect: const ExpandingDotsEffect(
                        dotHeight: 10.0,
                        dotColor: Colors.grey,
                        expansionFactor: 4,
                        dotWidth: 10.0,
                        spacing: 5.0,
                        activeDotColor: defaultColor),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: defaultColor,
                    onPressed: () {
                      if (isLast == true) {
                        submit();
                      } else {
                        boardcontroller.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          const SizedBox(
            height: 51,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${model.title}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              children: [
                Text(
                  '${model.text1}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                Text(
                  '${model.text2}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
              ],
            ),
          )
        ],
      );
}
