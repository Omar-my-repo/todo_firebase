import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_todoapp/network/local/firebase_utils.dart';
import 'package:route_todoapp/shared/components/task_item.dart';
import 'package:route_todoapp/style/color.dart';

import '../models/task.dart';

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
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
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
        const SizedBox(height: 10),
        StreamBuilder<QuerySnapshot<Task>>(
            stream: getTaskFromFirestore(_today),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              var tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              return Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskItem(tasks[index]);
                  },
                ),
              );
            })
      ],
    );
  }
}
