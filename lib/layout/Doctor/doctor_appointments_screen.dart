import 'package:flutter/material.dart';
import 'package:phsyo/layout/Doctor/doctor_profile_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';

class CategoryModel {
  final String? image;
  final String? text;
  CategoryModel({required this.image, required this.text});
}

class AppointmentsDoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const TabBar(
              indicatorColor: defaultColor,
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'UpComing',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: defaultColor,
                        fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'History',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: defaultColor,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TabBarView(
              children: <Widget>[
                ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => clientCard(context),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                    itemCount: 10),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => clientCard(context),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                    itemCount: 3),
              ],
            ),
          )),
    );
  }

  Widget clientCard(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          height: 140.84,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ]),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                    child: Image.network(
                      "https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/277168566_3170250476597636_7599140686835869072_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=0s3WD-hwKU0AX_WNEKX&_nc_ht=scontent.fcai22-1.fna&oh=00_AT9fuBp2SsRLH7vQWzG-RJSA-UkFxcyjhdl51j1J2kx4Vg&oe=624593BF",
                      width: 89,
                      height: 141,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 14.89,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  const Icon(
                                    Icons.assignment_ind_outlined,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  Container(
                                    width: 140,
                                    child: const Text(
                                      'Gamal Sayed',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  Container(
                                    width: 140.0,
                                    child: const Text(
                                      '7th March | 11:00 AM',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0XFF616161),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  const Icon(
                                    Icons.chat,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  Container(
                                    width: 140.0,
                                    child: const Text(
                                      'Couple Session',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0XFF616161),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ]),
                                Row(children: [
                                  const Icon(
                                    Icons.video_camera_front,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  Container(
                                    width: 180,
                                    child: const Text(
                                      'Video Call',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0XFF616161),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 5.0,
                      ),
                      Row(
                        children: [
                          defaultButton(
                            color: Colors.white,
                            height: 30,
                            function: () {},
                            isUpperCase: false,
                            text: 'View Profile',
                            textsize: 12.0,
                            textColor: defaultColor,
                            verticalpadding: 0.0,
                            width: 103,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          defaultButton(
                            height: 30,
                            function: () {},
                            isUpperCase: false,
                            text: 'Start a Call',
                            textsize: 12.0,
                            verticalpadding: 0.0,
                            width: 103,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
