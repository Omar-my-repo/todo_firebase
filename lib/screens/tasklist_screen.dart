import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
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
        Expanded(
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 80,
                      color: primaryColor,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'task Tilte',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: primaryColor, fontSize: 26),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'task desc',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: colorBlack, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 14),
                    Container(
                      width: 40,
                      height: 35,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
