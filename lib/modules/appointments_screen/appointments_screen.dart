import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/constants.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/models/appointmentModel/appointment_model.dart';
import 'package:phsyo/modules/client_profile/client_profile.dart';
import 'package:phsyo/modules/jitsi_screen/jisti.dart';
import 'package:phsyo/modules/profile_screen/profile_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../models/Doctorappointment/DoctorAppointment.dart';
import '../../shared/components/components.dart';
import '../../styles/colors.dart';

class CategoryModel {
  final String? image;
  final String? text;
  CategoryModel({required this.image, required this.text});
}

class AppointmentsScreen extends StatelessWidget {
  AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
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
                    doctor == false
                        ? AppCubit.get(context).appointmentModel == null
                            ? const Center(
                                child: Text('Ther Is No Appointment For You'),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => doctorCard(
                                    context,
                                    AppCubit.get(context).appointmentModel,
                                    index),
                                itemCount:
                                    AppCubit.get(context).appointmentModel == 0
                                        ? 0
                                        : AppCubit.get(context)
                                            .appointmentModel!
                                            .allReservations
                                            .length)
                        : AppCubit.get(context).doctorAppointmentModel == null
                            ? const Center(
                                child: Text('Ther Is No Appointment For You'),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => clientCard(
                                    context,
                                    AppCubit.get(context)
                                        .doctorAppointmentModel!,
                                    index),
                                itemCount: AppCubit.get(context)
                                    .doctorAppointmentModel!
                                    .totalbooking
                                    .length),
                    Container()
                    /*               ListView.separated(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => doctor == true
                            ? clientCard(
                                context,
                                AppCubit.get(context).doctorAppointmentModel!,
                                index)
                            : doctorCard(context,
                                AppCubit.get(context).appointmentModel, index),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 8,
                            ),
                        itemCount: 3),
       */
                  ],
                ),
              )),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget doctorCard(context, AppointmentModel? model, var index) {
    var doctor = model?.allReservations[index].doctor;
    return Padding(
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
                        doctor?.image == null
                            ? Container()
                            : Image.network(
                                doctor!.image.toString(),
                                width: 89,
                                height: 139,
                                fit: BoxFit.cover,
                              )
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
                                    doctor!.name.toString(),
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
                                    model!.allReservations[index].startDate
                                        .toString(),
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
                                    doctor.profession.toString(),
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
                              idUser: model.allReservations[index].userId
                                  .toString(),
                              image: doctor.image.toString(),
                              startDate: model.allReservations[index].startDate
                                  .toString(),
                              appointmentId:
                                  model.allReservations[index].id.toString(),
                              date:
                                  model.allReservations[index].date.toString(),
                              name: doctor.name.toString(),
                              profession: doctor.profession.toString(),
                              roomName: model.allReservations[index].roomName
                                  .toString(),
                              idDoctor: doctor.id.toString(),
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
                        AppCubit.get(context).getReviews(doctor.id.toString());
                        navigateTo(
                            context,
                            ProfileScreen(
                                id: doctor.id.toString(),
                                job: doctor.profession.toString(),
                                salary: doctor.sessionPrice.toString(),
                                isDoctor: false,
                                name: doctor.name.toString(),
                                image: doctor.image.toString(),
                                profission: doctor.profession.toString(),
                                languages: doctor.languages,
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
  }

  Widget clientCard(context, DoctorAppointmentModel? model, var index) =>
      Padding(
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
                      model!.totalbooking[index].userId!.image.toString(),
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
                                  SizedBox(
                                    width: 140,
                                    child: Text(
                                      model.totalbooking[index].userId!.name
                                          .toString(),
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
                                      '${model.totalbooking[index].date} | ${model.totalbooking[index].startDate}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
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
                            function: () {
                              AppCubit.get(context).getReport(model
                                  .totalbooking[index].userId!.id
                                  .toString());
                              print(model.totalbooking[index].userId!.id
                                  .toString());
                              navigateTo(
                                  context,
                                  ClientProfileScreen(
                                      name: model
                                          .totalbooking[index].userId!.name
                                          .toString(),
                                      id: model.totalbooking[index].userId!.id
                                          .toString(),
                                      image: model
                                          .totalbooking[index].userId!.image
                                          .toString(),
                                      gender: model
                                          .totalbooking[index].userId!.gender
                                          .toString(),
                                      birthDate: '7/5/2000',
                                      trustedContact: '01224122391',
                                      medicalHistory: 'noun',
                                      contactRelation: 'mom'));
                            },
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
                            function: () {
                              navigateTo(
                                  context,
                                  Meeting(
                                      roomName: model
                                          .totalbooking[index].roomName
                                          .toString(),
                                      name: model
                                          .totalbooking[index].userId!.name
                                          .toString(),
                                      profession: model.totalbooking[index]
                                          .doctor!.profession
                                          .toString(),
                                      appointmentId: model
                                          .totalbooking[index].id
                                          .toString(),
                                      date: model.totalbooking[index].date
                                          .toString(),
                                      image: model
                                          .totalbooking[index].userId!.image
                                          .toString(),
                                      startDate: model
                                          .totalbooking[index].startDate
                                          .toString(),
                                      idDoctor: model
                                          .totalbooking[index].doctor!.id
                                          .toString(),
                                      idUser: model
                                          .totalbooking[index].userId!.id
                                          .toString()));
                            },
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
