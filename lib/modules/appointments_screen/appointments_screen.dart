import 'package:flutter/material.dart';
import 'package:phsyo/constants.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/models/appointmentModel/appointment_model.dart';
import 'package:phsyo/modules/jitsi_screen/jisti.dart';
import 'package:phsyo/modules/profile_screen/profile_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../shared/components/components.dart';
import '../../styles/colors.dart';

class CategoryModel {
  final String? image;
  final String? text;
  CategoryModel({required this.image, required this.text});
}

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

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
                AppCubit.get(context).appointmentModel?.allReservations == null
                    ? Container()
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => doctor == true
                            ? clientCard(context)
                            : doctorCard(context,
                                AppCubit.get(context).appointmentModel, index),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 8,
                            ),
                        itemCount: doctor == true
                            ? 3
                            : AppCubit.get(context)
                                .appointmentModel!
                                .allReservations
                                .length),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => doctor == true
                        ? clientCard(context)
                        : doctorCard(context,
                            AppCubit.get(context).appointmentModel, index),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                    itemCount: 3),
              ],
            ),
          )),
    );
  }

  Widget doctorCard(context, AppointmentModel? model, var index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          height: 139,
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
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircularProgressIndicator(
                            color: defaultColor,
                          ),
                          Image.network(
                            model!.allReservations[index].doctor.image,
                            width: 89,
                            height: 139,
                            fit: BoxFit.cover,
                          )
                          /*  FadeInImage.memoryNetwork(
                            fadeInDuration: const Duration(milliseconds: 300),
                            placeholder: kTransparentImage,
                            image: model!.allReservations[index].doctor!.image
                                .toString(),
                            width: 89,
                            height: 139,
                            fit: BoxFit.cover,
                          ), */
                        ],
                      )),
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
                                    Icons.add_circle_outline,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  SizedBox(
                                    width: 140,
                                    child: Text(
                                      model.allReservations[index].doctor.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
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
                                  SizedBox(
                                    width: 140.0,
                                    child: Text(
                                      model.allReservations[index].startDate,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0XFF616161),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  const Icon(
                                    Icons.work,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  const SizedBox(
                                    width: 6.11,
                                  ),
                                  SizedBox(
                                    width: 140.0,
                                    child: Text(
                                      model.allReservations[index].doctor
                                          .profession,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0XFF616161),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ]),
                                Row(children: const [
                                  Icon(
                                    Icons.chat,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  SizedBox(
                                    width: 6.11,
                                  ),
                                  SizedBox(
                                    width: 180,
                                    child: Text(
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
                            //  SizedBox(),
                          ],
                        ),
                        /* const SizedBox(
                          height: 10.0,
                        ),  */ //buttons
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
                      defaultButton(
                        height: 30,
                        function: () {
                          navigateTo(
                              context,
                              Meeting(
                                image:
                                    model.allReservations[index].doctor.image,
                                startDate:
                                    model.allReservations[index].startDate,
                                appointmentId: model.allReservations[index].id,
                                date: model.allReservations[index].date,
                                name: model.allReservations[index].doctor.name,
                                profession: model
                                    .allReservations[index].doctor.profession,
                                roomName: model.allReservations[index].roomName,
                                idDoctor:
                                    model.allReservations[index].doctor.id,
                              ));
                        },
                        isUpperCase: false,
                        icon: Icons.call,
                        text: 'Start Session',
                        textsize: 12.0,
                        verticalpadding: 0.0,
                        width: 33.w,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      defaultButton(
                        function: () {
                          AppCubit.get(context).getReviews(model
                              .allReservations[index].doctor.id
                              .toString());
                          navigateTo(
                              context,
                              ProfileScreen(
                                  id: model.allReservations[index].doctor.id,
                                  job: model
                                      .allReservations[index].doctor.profession,
                                  salary: model.allReservations[index].doctor
                                      .sessionPrice,
                                  isDoctor: false,
                                  name:
                                      model.allReservations[index].doctor.name,
                                  image:
                                      model.allReservations[index].doctor.image,
                                  profission: model
                                      .allReservations[index].doctor.profession,
                                  languages: model
                                      .allReservations[index].doctor.languages,
                                  yearOfExperience: '6'));
                        },
                        height: 30,
                        isUpperCase: false,
                        text: 'Profile',
                        color: Colors.white,
                        textColor: defaultColor,
                        textsize: 12.0,
                        verticalpadding: 0.0,
                        width: 20.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

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
                      'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcTNextvuebWgjZBLJgZPTvBf8hU3Cb6YwMolwLm3Y9Zl-KChVcOwAefelU58-rOeYCvAYH7cITY3B7v6A9LvWE',
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
                                Row(children: const [
                                  Icon(
                                    Icons.assignment_ind_outlined,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  SizedBox(
                                    width: 6.11,
                                  ),
                                  SizedBox(
                                    width: 140,
                                    child: Text(
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
                                Row(children: const [
                                  Icon(
                                    Icons.calendar_today,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  SizedBox(
                                    width: 6.11,
                                  ),
                                  SizedBox(
                                    width: 140.0,
                                    child: Text(
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
                                Row(children: const [
                                  Icon(
                                    Icons.chat,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  SizedBox(
                                    width: 6.11,
                                  ),
                                  SizedBox(
                                    width: 140.0,
                                    child: Text(
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
                                Row(children: const [
                                  Icon(
                                    Icons.video_camera_front,
                                    color: defaultColor,
                                    size: 14.0,
                                  ),
                                  SizedBox(
                                    width: 6.11,
                                  ),
                                  SizedBox(
                                    width: 180,
                                    child: Text(
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
                          const SizedBox(
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
