import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:route_todoapp/network/local/firebase_utils.dart';
import 'package:route_todoapp/shared/components/components.dart';

import '../../models/task.dart';
import '../../style/color.dart';

class TaskItem extends StatelessWidget {
  Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: 6),
          SlidableAction(
            onPressed: (context) {
              deleteTaskFromFirestore(task.id);
            },
            borderRadius: BorderRadius.circular(14),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          const SizedBox(width: 6),
          // SlidableAction(
          //   onPressed: (context) {},
          //   borderRadius: BorderRadius.circular(14),
          //   backgroundColor: Colors.grey,
          //   foregroundColor: Colors.white,
          //   icon: Icons.edit,
          //   label: 'Edit',
          // ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        padding: const EdgeInsets.all(16),
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
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${task.title}',
                    style: task.isDone == false
                        ? Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: primaryColor, fontSize: 26)
                        : Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.green, fontSize: 26),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${task.description}',
                    style: task.isDone == false
                        ? Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: colorBlack, fontSize: 22)
                        : Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.green, fontSize: 22),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            InkWell(
              onTap: () {
                task.isDone = !task.isDone;
                updateTaskFromFirestore(task.id, task)
                    .then((value) => null)
                    .onError((error, stackTrace) => ShowMessage(
                        context: context,
                        title: 'Error',
                        content: 'something went wrong, check your connection',
                        postiveBtnMsg: 'OK',
                        postiveAct: () {
                          hideMessage(context);
                        }));
              },
              child: Container(
                width: 40,
                height: 35,
                decoration: BoxDecoration(
                  color: task.isDone == false ? primaryColor : Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
