import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/models/hourModel.dart';
import 'package:phsyo/modules/appoint_screen/utls.dart';
import 'package:phsyo/modules/login_screen/login_cubit.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import 'appoint_payment.dart';

class AppointScreen extends StatefulWidget {
  const AppointScreen(
      {Key? key,
      required this.isDoctor,
      required this.id,
      required this.image,
      required this.name,
      required this.job,
      required this.salary})
      : super(key: key);
  final bool isDoctor;
  final String id;
  final String image;
  final String name;
  final String job;
  final String salary;

  @override
  State<AppointScreen> createState() => _AppointScreenState();
}

class _AppointScreenState extends State<AppointScreen> {
  Map<DateTime, List<Event>>? selectedEvents;
  List<dynamic>? events;
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  var eventController = TextEditingController();
  String radiovalue = '';
  bool isSelected2 = false;
  String? startAt;
  String? endAt;
  String? startAtfull;

  void changeRadio(value) {
    setState(() {
      radiovalue = value;
    });
  }

  List<HourModel> morningSlots = [
    HourModel('12', false),
    HourModel('1', false),
    HourModel('2', false),
    HourModel('3', false),
    HourModel('4', false),
    HourModel('5', false),
    HourModel('6', false),
    HourModel('7', false),
    HourModel('8', false),
    HourModel('9', false),
    HourModel('10', false),
    HourModel('11', false),
  ];
  List<HourModel> eveninggSlots = [
    HourModel('12', false),
    HourModel('1', false),
    HourModel('2', false),
    HourModel('3', false),
    HourModel('4', false),
    HourModel('5', false),
    HourModel('6', false),
    HourModel('7', false),
    HourModel('8', false),
    HourModel('9', false),
    HourModel('10', false),
    HourModel('11', false),
  ];

  @override
  void initState() {
    selectedEvents = {};
    events = [];
    // ignore: todo
    // TODO: implement initState
    super.initState();
    if (widget.isDoctor == false) {
      AppCubit.get(context).getDoctorHours(widget.id);
    }
  }

  @override
  void dispose() {
    eventController.dispose();
    super.dispose();
  }

  List<Event> _getEventFromDay(DateTime date) {
    return selectedEvents![date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessDoctorReservationState) {
          showToast(text: 'Done', state: ToastStates.success);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Schedule Appointment'),
            elevation: 2.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  AppCubit.get(context).doctorsEveningHours.length = 0;
                  AppCubit.get(context).doctorsMorningHours.length = 0;
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
            child: ListView(
              children: [
                SizedBox(
                  child: TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: kLastDay,
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    eventLoader: _getEventFromDay,
                    calendarStyle: CalendarStyle(
                        disabledTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        outsideTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        defaultTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        weekendTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        selectedTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        holidayTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        weekendDecoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: defaultColor)),
                        holidayDecoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: defaultColor)),
                        defaultDecoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: defaultColor)),
                        isTodayHighlighted: true,
                        rangeHighlightColor: defaultColor,
                        todayTextStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        todayDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.red,
                            )),
                        selectedDecoration: const BoxDecoration(
                            color: defaultColor, shape: BoxShape.circle)),
                    headerStyle: const HeaderStyle(
                        titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        formatButtonVisible: false,
                        titleCentered: true),
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;

                          AppCubit.get(context).getHours(
                            DateFormat('yyyy-MM-dd')
                                .format(_selectedDay!)
                                .toString(),
                          );
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Morning Slots',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff333333),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      widget.isDoctor == false
                          ? AppCubit.get(context).doctorsMorningHours.isEmpty
                              ? const Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Sorry Their Is No Available Hours This Day',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: AppCubit.get(context)
                                              .doctorsMorningHours
                                              .length >
                                          4
                                      ? 90
                                      : 55,
                                  child: GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: AppCubit.get(context)
                                          .doctorsMorningHours
                                          .length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisExtent: 40,
                                      ),
                                      itemBuilder: (_, index) => timeSlotWidget(
                                          type: '',
                                          model: AppCubit.get(context)
                                              .doctorsMorningHours[index])),
                                )
                          : SizedBox(
                              height: 90,
                              child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: morningSlots.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 6,
                                    mainAxisExtent: 40,
                                  ),
                                  itemBuilder: (_, index) {
                                    return timeSlotWidget(
                                        type: ' am',
                                        model: morningSlots[index]);
                                  }),
                            ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Evening Slots',
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      widget.isDoctor == false
                          ? AppCubit.get(context).doctorsEveningHours.isEmpty
                              ? const Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Sorry Their Is No Available Hours This Day',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: AppCubit.get(context)
                                              .doctorsMorningHours
                                              .length >
                                          4
                                      ? 90
                                      : 55,
                                  child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: AppCubit.get(context)
                                        .doctorsEveningHours
                                        .length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisExtent: 40,
                                    ),
                                    itemBuilder: (_, index) => timeSlotWidget(
                                        type: '',
                                        model: AppCubit.get(context)
                                            .doctorsEveningHours[index]),
                                  ),
                                )
                          : SizedBox(
                              height: 90,
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: eveninggSlots.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  mainAxisExtent: 40,
                                ),
                                itemBuilder: (_, index) => timeSlotWidget(
                                  type: ' pm',
                                  model: eveninggSlots[index],
                                  //   value: morningSlots[index].hour![index],
                                  //  hour: morningSlots[index].hour![index],
                                ),
                              ),
                            )
                    ]),
                widget.isDoctor == false
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Type of Session',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              buildRadioBig('chat', context),
                              const Spacer(),
                              buildRadioBig('video', context),
                            ],
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state is AppLoadingDoctorReservationState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : defaultButton(
                            function: () {
                              if (widget.isDoctor == false) {
                                if (_selectedDay != null &&
                                    startAtfull != null) {
                                  navigateTo(
                                      context,
                                      PaymentAppointScreen(
                                        doctorId: widget.id.toString(),
                                        roomName: widget.id +
                                            LoginCubit.get(context)
                                                .profileModel!
                                                .user
                                                .id
                                                .toString(),
                                        salary: widget.salary,
                                        date: DateFormat('yyyy-MM-dd')
                                            .format(_selectedDay!)
                                            .toString(),
                                        day: DateFormat('EEEEE')
                                            .format(_selectedDay!)
                                            .toString(),
                                        startDate: startAtfull.toString(),
                                        image: widget.image,
                                        job: widget.job,
                                        name: widget.name,
                                        typeOfSession: radiovalue,
                                      ));
                                }
                              } else if (widget.isDoctor == true) {
                                if (_selectedDay != null &&
                                    startAtfull != null) {
                                  AppCubit.get(context).doctorReservation(
                                      date: _selectedDay.toString(),
                                      day: DateFormat('EEEEE')
                                          .format(_selectedDay!),
                                      endAt: endAt.toString(),
                                      startAt: startAtfull.toString());
                                }
                              }
                            },
                            text: 'Confirm',
                            width: 250),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildRadioBig(
    String value,
    context,
  ) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: radiovalue,
            onChanged: (value) {
              changeRadio(value);
            }),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }

  Widget timeSlotWidget({
    required String? type,
    HourModel? model,
    String? value,
  }) {
    value = '${model?.hour}$type';
    return InkWell(
      onTap: () {
        startAtfull = '${model!.hour}$type';

        startAt = model.hour;
        endAt =
            widget.isDoctor == true ? '${int.parse(model.hour!) + 1}$type' : '';
        print(startAtfull);

        for (var element in morningSlots) {
          String? t;
          type == 'pm' ? t = 'am' : '';
          if ('${element.hour}$t' != startAtfull) {
            setState(() {
              element.isSelected = false;
            });
          }
        }
        for (var element in eveninggSlots) {
          String? t;
          type == 'pm' ? t = 'am' : '';
          if ('${element.hour}$t' != startAtfull) {
            setState(() {
              element.isSelected = false;
            });
          }
        }
        for (var element in AppCubit.get(context).doctorsMorningHours) {
          if ('${element.hour}' != startAtfull) {
            setState(() {
              element.isSelected = false;
            });
          }
        }
        for (var element in AppCubit.get(context).doctorsEveningHours) {
          if ('${element.hour}' != startAtfull) {
            setState(() {
              element.isSelected = false;
            });
          }
        }

        setState(() {
          model.isSelected != null
              ? model.isSelected = !model.isSelected!
              : null;
        });
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: model!.isSelected != null
                  ? model.isSelected == false
                      ? Colors.white
                      : defaultColor
                  : null,
              border: Border.all(color: defaultColor, width: 1.8)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  model.hour.toString() + type!,
                  style: TextStyle(
                      color: model.isSelected != null
                          ? model.isSelected == false
                              ? Colors.black
                              : Colors.white
                          : null,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
