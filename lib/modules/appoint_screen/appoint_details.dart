import 'package:flutter/material.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:uuid/uuid.dart';

class AppointDetails extends StatelessWidget {
  var id = const Uuid().v4();

  AppointDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('schedule Appointment'),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    color: defaultColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Appointment Confirmed',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 3.h),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Booking ID : $id',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 2.h),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              children: [
                                Text(
                                  'Make sure you have a stable internet  ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 2.h),
                                ),
                                Text(
                                  'connection with a working camera',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 2.h),
                                ),
                                Text(
                                  'for the session.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 2.h),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Appointment Details',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Card(
                            elevation: 10,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                    image:
                                        'https://scontent.faly3-1.fna.fbcdn.net/v/t39.30808-6/280198885_3204029853219698_8376329503209490497_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=WZr1yHelb5QAX-f457q&_nc_ht=scontent.faly3-1.fna&oh=00_AT88YJUEJ0tWGAALdhlflH-y3fuzxlyPORGjdSbPLOYoEg&oe=629F69CF',
                                    width: 89,
                                    height: 134,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: const [
                            Text(
                              'Dr. Ahmed Ali',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Yoga Instructor',
                              style: TextStyle(
                                color: Color(0xff606060),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'General Physician',
                              style: TextStyle(
                                color: defaultColor,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: defaultColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Date & Time',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Spacer(),
                            Text('15 March | 5 PM')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.laptop_mac_outlined,
                              color: defaultColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Type of Session',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Spacer(),
                            Text('Video Call')
                          ],
                        ),
                        const Spacer(),
                        defaultButton(
                            function: () {},
                            text: 'Done',
                            height: 50,
                            width: 250)
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
