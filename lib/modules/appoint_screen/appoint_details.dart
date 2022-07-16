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
                                  image:
                                      'https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/280198885_3204029853219698_8376329503209490497_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=RrjXLjRKX_IAX-RCutq&_nc_ht=scontent.fcai22-1.fna&oh=00_AT-2KVoLkPpML4rOFcnVqaTaXV-rF3OmaNbCBYMKY2kqLQ&oe=62D4CE8F',
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
                            'Dr. Ahmed Ali',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 3.h,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Yoga Instructor',
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
                          const Text('15 March | 5 PM')
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
                          const Text('Video Call')
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      //const Spacer(),
                      defaultButton(
                          function: () {},
                          text: 'Done',
                          height: 7.5.h,
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
