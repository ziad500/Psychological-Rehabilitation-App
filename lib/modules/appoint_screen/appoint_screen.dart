import 'package:flutter/material.dart';
import 'package:phsyo/modules/appoint_screen/utls.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import 'appoint_payment.dart';

class AppointScreen extends StatefulWidget {
  const AppointScreen({Key? key}) : super(key: key);

  @override
  State<AppointScreen> createState() => _AppointScreenState();
}

class _AppointScreenState extends State<AppointScreen> {
  Map<DateTime, List<Event>>? selectedEvents;
  List<dynamic>? events;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  var eventController = TextEditingController();
  String radiovalue = '';
  void changeRadio(value) {
    setState(() {
      radiovalue = value;
    });
  }

  List<String> morningSlots = [
    '12 AM',
    '1 AM',
    '2 AM',
    '3 AM',
    '4 AM',
    '5 AM',
    '6 AM',
    '7 AM',
    '8 AM',
    '9 AM',
    '10 AM',
    '11 AM'
  ];

  @override
  void initState() {
    selectedEvents = {};
    events = [];
    // TODO: implement initState
    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Appointment'),
        elevation: 2.0,
        backgroundColor: Colors.white,
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
                      print(DateTime(_selectedDay!.year, _selectedDay!.month,
                              _selectedDay!.day) ==
                          DateTime(DateTime.now().year, DateTime.now().month,
                              DateTime.now().day));
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
            DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: const TabBar(tabs: [
                        Padding(
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
                        Padding(
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
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 90,
                      child: TabBarView(children: [
                        SizedBox(
                          height: 78,
                          child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: morningSlots.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6,
                                mainAxisExtent: 40,
                              ),
                              itemBuilder: (_, index) => Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: defaultColor, width: 1.8)),
                                      child: Center(
                                        child: Text(
                                          morningSlots[index],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                        Container(
                          height: 78,
                          child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: morningSlots.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6,
                                mainAxisExtent: 40,
                              ),
                              itemBuilder: (_, index) => Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: defaultColor, width: 1.8)),
                                      child: Center(
                                        child: Text(
                                          morningSlots[index],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ]),
                    )
                  ],
                ))
            /*     Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Morning Slots',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              height: 78,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: morningSlots.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisExtent: 40,
                  ),
                  itemBuilder: (_, index) => Card(
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: defaultColor, width: 1.8)),
                          child: Center(
                            child: Text(
                              morningSlots[index],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Evening Slots',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
                height: 78,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: morningSlots.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      mainAxisExtent: 40,
                    ),
                    itemBuilder: (_, index) => Card(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: defaultColor, width: 1.8)),
                            child: Center(
                              child: Text(
                                morningSlots[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ))),
        */

            ,
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defaultButton(
                    function: () {
                      navigateTo(context, const PaymentAppointScreen());
                    },
                    text: 'Confirm',
                    width: 250),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildRadioBig(String value, context) {
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
}
