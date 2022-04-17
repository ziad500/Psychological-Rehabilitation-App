import 'package:flutter/material.dart';
import 'package:phsyo/modules/appoint_screen/utls.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';

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

  @override
  void initState() {
    selectedEvents = {};
    events = [];
    // TODO: implement initState
    super.initState();
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('add event'),
              content: TextField(
                controller: eventController,
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text('OK'))
              ],
            ),
          );
          print(_selectedDay);
        },
      ),
      appBar: AppBar(
        elevation: 9.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: TableCalendar(
          firstDay: DateTime.now(),
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          eventLoader: _getEventFromDay,
          calendarStyle: CalendarStyle(
              disabledTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
              outsideTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              defaultTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              weekendTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              selectedTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              holidayTextStyle: const TextStyle(fontWeight: FontWeight.bold),
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
                  color: Colors.black, fontWeight: FontWeight.bold),
              todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red)),
              selectedDecoration: const BoxDecoration(
                  color: defaultColor, shape: BoxShape.circle)),
          headerStyle: const HeaderStyle(
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                print(selectedDay);
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
    );
  }
}
