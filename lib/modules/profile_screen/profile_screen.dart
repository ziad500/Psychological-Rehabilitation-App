import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/models/reviewModel/review_model.dart';
import 'package:phsyo/modules/appoint_screen/appoint_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.profission,
      required this.languages,
      required this.yearOfExperience,
      required this.isDoctor,
      required this.id,
      required this.job,
      required this.salary})
      : super(key: key);
  final String name;
  final String image;
  final String profission;
  final List<String> languages;
  final String yearOfExperience;
  final bool isDoctor;
  final String id;

  final String job;
  final String salary;

  IconData? _selectedIcon;
  bool _isVertical = false;
  double _userRating = 3.0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            title: const Text(
              'Profile',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 5.0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 33.0, vertical: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        const CircularProgressIndicator(
                                          color: defaultColor,
                                        ),
                                        FadeInImage.memoryNetwork(
                                          fadeInDuration:
                                              const Duration(milliseconds: 300),
                                          placeholder: kTransparentImage,
                                          image: image,
                                          width: 89,
                                          height: 134,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  const Icon(
                                    Icons.add_circle_outline,
                                    color: defaultColor,
                                    size: 17.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  Text(
                                    name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 21.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  const Icon(
                                    Icons.work,
                                    color: defaultColor,
                                    size: 17.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  Text(
                                    profission,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0XFF616161),
                                    ),
                                  )
                                ]),
                                Row(children: const [
                                  Icon(
                                    Icons.stars,
                                    color: defaultColor,
                                    size: 17.0,
                                  ),
                                  SizedBox(
                                    width: 6.11,
                                  ),
                                  Text(
                                    '6 years Of Experience'
                                    /*  DateFormat('yyyy-MM-dd | hh:mm')
                                        .format(DateTime.parse(
                                            yearOfExperience.toString()))
                                        .toString() */
                                    ,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0XFF616161),
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  const Icon(
                                    Icons.language,
                                    color: defaultColor,
                                    size: 17.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  Text(
                                    languages.join(','),
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0XFF616161),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      defaultButton(
                          function: () {
                            navigateTo(
                                context,
                                AppointScreen(
                                    isDoctor: false,
                                    id: id,
                                    image: image,
                                    name: name,
                                    job: job,
                                    salary: salary));
                          },
                          text: 'Book a Session',
                          height: 40,
                          verticalpadding: 5),
                      const SizedBox(
                        height: 20,
                      ),
                      myDivider(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.rate_review,
                            color: defaultColor,
                          ),
                          SizedBox(
                            width: 2.5,
                          ),
                          Text(
                            'Reviews',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      state is AppLoadingGetReviewState
                          ? const CircularProgressIndicator()
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => reviewItem(
                                  AppCubit.get(context).reviewModel, index),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 2.0,
                                  ),
                              itemCount: AppCubit.get(context)
                                  .reviewModel!
                                  .reviews
                                  .length)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget reviewItem(ReviewModel? model, var index) => Card(
          child: Container(
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: defaultColor)),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model!.reviews[index].user!.name,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat('yyyy-MM-dd | hh:mm')
                              .format(DateTime.parse(
                                  model.reviews[index].createdAt.toString()))
                              .toString(),
                          /* model.reviews[index].createdAt.toString() */
                          style: TextStyle(color: Colors.grey[850]),
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: model.reviews[index].rating!.toDouble(),
                              itemBuilder: (context, index) => Icon(
                                _selectedIcon ?? Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              unratedColor: Colors.amber.withAlpha(50),
                              direction:
                                  _isVertical ? Axis.vertical : Axis.horizontal,
                            ),
                            // Icon(Icons.star, color: Colors.yellow[800]),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      model.reviews[index].comment.toString(),
                      style: const TextStyle(
                        color: Color(0xff414141),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ));
}
