import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/layout/layout.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:uuid/uuid.dart';

class AppointDetails extends StatelessWidget {
  AppointDetails(
      {Key? key,
      required this.day,
      required this.startDate,
      required this.date,
      required this.roomName,
      required this.doctorId,
      required this.image,
      required this.name,
      required this.job,
      required this.typeOfSession,
      required this.appointmentId})
      : super(key: key);
  final String day;
  final String startDate;
  final String date;
  final String roomName;
  final String doctorId;
  final String image;
  final String name;
  final String job;
  final String typeOfSession;
  final String appointmentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('schedule Appointment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: double.infinity,
                  color: defaultColor,
                  height: 30.h,
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
                            'Booking ID : $appointmentId',
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
            ),
            Stack(
              children: [
                Container(
                  color: Colors.white,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Appointment Details',
                            style: TextStyle(
                                fontSize: 3.h, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
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
                                  image: image,
                                  width: 89,
                                  height: 15.h,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 3.h,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            job,
                            style: TextStyle(
                              color: const Color(0xff606060),
                              fontSize: 2.5.h,
                            ),
                          ),
                          Text(
                            'General Physician',
                            style: TextStyle(
                              color: defaultColor,
                              fontSize: 2.5.h,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded,
                            color: defaultColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Date & Time',
                            style: TextStyle(fontSize: 2.5.h),
                          ),
                          const Spacer(),
                          Text('$date | $startDate')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.laptop_mac_outlined,
                            color: defaultColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Type of Session',
                            style: TextStyle(fontSize: 2.5.h),
                          ),
                          const Spacer(),
                          Text(typeOfSession)
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      //const Spacer(),
                      defaultButton(
                          function: () {
                            navigateAndFinish(context, const Applayout());
                          },
                          text: 'Done',
                          height: 6.5.h,
                          width: 60.w)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
