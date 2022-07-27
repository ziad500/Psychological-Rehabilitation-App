import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/models/ReportsModel/reports_model.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen(
      {Key? key,
      required this.name,
      required this.id,
      required this.image,
      required this.gender,
      required this.birthDate,
      required this.trustedContact,
      required this.medicalHistory,
      required this.contactRelation})
      : super(key: key);
  final String name;
  final String id;
  final String image;
  final String gender;
  final String birthDate;
  final String trustedContact;
  final String medicalHistory;
  final String contactRelation;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
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
              padding: const EdgeInsets.symmetric(horizontal: 33.0),
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
                                Container(
                                  height: 120,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 6,
                                          offset: Offset(0, 3),
                                        )
                                      ],
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(image))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                const Icon(
                                  Icons.assignment_ind_rounded,
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
                                  Icons.male_rounded,
                                  color: defaultColor,
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 6.11,
                                ),
                                Text(
                                  gender,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0XFF616161),
                                  ),
                                )
                              ]),
                              Row(children: [
                                const Icon(
                                  Icons.calendar_today,
                                  color: defaultColor,
                                  size: 17.0,
                                ),
                                const SizedBox(
                                  width: 6.11,
                                ),
                                Text(
                                  birthDate,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0XFF616161),
                                  ),
                                ),
                              ]),
                              Row(children: const [
                                Icon(
                                  Icons.person_pin,
                                  color: defaultColor,
                                  size: 17.0,
                                ),
                                SizedBox(
                                  width: 6.11,
                                ),
                                Text(
                                  'Trusted Contact',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0XFF616161),
                                  ),
                                ),
                              ]),
                              Row(children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text(
                                  'Phone',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Color(0XFF616161),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$trustedContact "$contactRelation"',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0XFF616161),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      myDivider(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.medical_services_rounded,
                            color: defaultColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Medical History',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        medicalHistory,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      myDivider(),
                      const SizedBox(
                        height: 10,
                      ),
                      /* AppCubit.get(context).getReportModel == null */ state
                              is AppLoadingGetReportState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => reportItem(
                                  context,
                                  AppCubit.get(context).getReportModel,
                                  index),
                              itemCount: AppCubit.get(context)
                                  .getReportModel!
                                  .report
                                  .length,
                            )
/*                   reportItem(context,AppCubit.get(context).getReportModel,index)
 */
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  /*  Widget bottomSheet(context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(40.0)),
          ),
          height: 350.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('icons/undraw_completed_re_cisp.png'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Registration Done',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                Text(
                  'Successfully',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: defaultColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                    function: () {
                      LoginCubit.get(context)
                          .userLogin(email: email, password: password);
                      // navigateAndFinish(context, const Applayout());
                    },
                    text: 'Start Your Journey')
              ],
            ),
          ),
        ),
      );
 */

  Widget report(context,
          {required String doctorName,
          required String doctorProfession,
          required String sessionType,
          required String condition,
          required String progress,
          required String plan,
          required String activities}) =>
      Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.transparent,
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
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: defaultColor, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(
                          'Session Report',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              fontSize: 20),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Doctor : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                doctorName,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        myDivider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Profession : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blue[900],
                                ),
                              ),
                              Text(
                                doctorProfession,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        myDivider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Session Type : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blue[900],
                                ),
                              ),
                              Text(
                                sessionType,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        myDivider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      color: Colors.amber,
                                      height: 5,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Descripe The Patient\'s Condition',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              myDivider(),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                condition,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      color: Colors.amber,
                                      height: 5,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Descripe The Patient\'s Condition',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              myDivider(),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                progress,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      color: Colors.amber,
                                      height: 5,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Descripe The Patient\'s Condition',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              myDivider(),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                plan,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      color: Colors.amber,
                                      height: 5,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Descripe The Patient\'s Condition',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              myDivider(),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                activities,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.exit_to_app),
                      color: defaultColor,
                      iconSize: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget reportItem(context, GetReportModel? model, index) => InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return report(context,
                  doctorName: model!.report[index].doctor.name,
                  sessionType: model.report[index].sessionType,
                  doctorProfession: model.report[index].doctor.profession,
                  condition: model.report[index].condition,
                  activities: model.report[index].activities,
                  plan: model.report[index].plan,
                  progress: model.report[index].progress);
            },
          );
        },
        child: Card(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.article,
                  color: defaultColor,
                  size: 50,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: Text(
                        'Reprt by ${model!.report[index].doctor.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: Text(
                        DateFormat('yyyy-MM-dd | hh:mm')
                            .format(DateTime.parse(
                                model.report[index].createdAt.toString()))
                            .toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    )
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
        )),
      );
}
