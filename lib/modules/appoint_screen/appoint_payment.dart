import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/modules/appoint_screen/appoint_details.dart';
import 'package:phsyo/shared/components/components.dart';

import '../../layout/cubit/app_cubit.dart';

class PaymentAppointScreen extends StatelessWidget {
  const PaymentAppointScreen(
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
      required this.salary})
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
  final String salary;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessClientReservationState) {
          navigateTo(
              context,
              AppointDetails(
                date: date,
                day: day,
                doctorId: doctorId,
                roomName: roomName,
                startDate: startDate,
                image: image,
                job: job,
                name: name,
                typeOfSession: typeOfSession,
                appointmentId: AppCubit.get(context).clientReservationModel!.id,
              ));
        } else if (state is AppErrorClientReservationState) {
          showToast(
              text: AppCubit.get(context).clientReservationModel?.message,
              state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Payment'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.money,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Session Fees',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      '$salary EGP',
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
                const Spacer(),
                Center(
                    child: state is AppLoadingClientReservationState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : defaultButton(
                            function: () {
                              /*    print(day);
                              print(startDate);
                              print(roomName);
                              print(date);
                              print(doctorId); */

                              AppCubit.get(context).clientReservation(
                                  day: day,
                                  startAt: startDate,
                                  roomName: roomName,
                                  date: date,
                                  doctorId: doctorId);
                            },
                            text: 'Continue'))
              ],
            ),
          ),
        );
      },
    );
  }
}
