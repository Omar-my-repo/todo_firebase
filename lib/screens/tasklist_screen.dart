import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:route_todoapp/style/color.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime _today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          // showYears: true,
          initialDate: _today,
          firstDate: _today,
          lastDate: DateTime.now().add(Duration(days: 365 * 4)),
          onDateSelected: (date) => setState(() => _today = date),
          leftMargin: 20,
          monthColor: colorBlack,
          dayColor: colorBlack,
          dayNameColor: Colors.white,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primaryColor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en',
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
