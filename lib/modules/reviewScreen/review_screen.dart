import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/layout/layout.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../styles/colors.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen(
      {Key? key,
      required this.name,
      required this.profession,
      required this.appointmentId,
      required this.date,
      required this.image,
      required this.startDate,
      required this.idDoctor})
      : super(key: key);
  final String name;
  final String profession;
  final String appointmentId;
  final String date;
  final String image;
  final String startDate;
  final String idDoctor;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  var reviewController = TextEditingController();
  late final _ratingController;
  late double _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessAddReviewState) {
          navigateAndFinish(context, const Applayout());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Review'),
          ),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 90),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
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
                                        Image.network(
                                          widget.image,
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
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add_circle_outline,
                                    color: defaultColor,
                                    size: 17.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  Text(
                                    widget.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 21.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.work,
                                    color: defaultColor,
                                    size: 17.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  Text(
                                    widget.profession,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0XFF616161),
                                    ),
                                  )
                                ]),
                          ),
                          const Text(
                            'You Visited On',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${widget.date} at ${widget.startDate}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                          const Text(
                            'For Regular Checkup',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Appointment id : ${widget.appointmentId}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // fit: FlexFit.loose  ,
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70),
                                topRight: Radius.circular(70)),
                            color: Color(0xffE8E8EE)),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'How Was Your Visit ?',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              _ratingBar(_ratingBarMode),
                              const Text(
                                'Write A Review',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 80.w,
                                child: defaultFormField(
                                  context,
                                  hint: 'write a review',
                                  controller: reviewController,
                                  type: TextInputType.visiblePassword,
                                  maxlines: 7,
                                  height: 20,
                                  review: true,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Your Password";
                                    }
                                  },
                                ),
                              ),
                              state is AppLoadingAddReviewState
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: defaultColor,
                                      ),
                                    )
                                  : defaultButton(
                                      function: () {
                                        AppCubit.get(context).addReview(
                                            id: widget.idDoctor,
                                            rating: _rating.toString(),
                                            comment: reviewController.text);
                                      },
                                      text: 'submit',
                                      color: Colors.white,
                                      textColor: Colors.black,
                                      isUpperCase: true)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _ratingBar(int mode) {
    switch (mode) {
      case 1:
        return RatingBar.builder(
          initialRating: _initialRating,
          minRating: 1,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.white,
          itemCount: 5,
          itemSize: 30.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            _selectedIcon ?? Icons.star,
            color: defaultColor,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 2:
        return RatingBar(
          initialRating: _initialRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: const Icon(
              Icons.star,
              color: defaultColor,
            ),
            half: const Icon(
              Icons.star_half,
              color: defaultColor,
            ),
            empty: const Icon(
              Icons.star_border,
              color: defaultColor,
            ),
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 3:
        return RatingBar.builder(
          initialRating: _initialRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return const Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return const Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return const Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
              default:
                return Container();
            }
          },
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      default:
        return Container();
    }
  }
}
