import 'package:flutter/cupertino.dart';
import 'package:route_todoapp/screens/task_modal_sheet/task_sheet_navigator.dart';

import '../../models/task.dart';
import '../../network/local/firebase_utils.dart';

class TaskSheetViewModel extends ChangeNotifier {
  late TaskSheetNavigator navigator;

  addTaskToFireStore(String title, String description, int time) {
    try {
      navigator.showLoading();
      Task task = Task(
        title: title,
        description: description,
        date: time,
      );
      addTaskToFirestore(task);
      navigator.hideLoading();
      navigator.showMessage('Your task has been successfully saved');
      // navigator.navigateBack();
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage('Failed to upload your task, try later..');

      print('ERROR IN ADDING TASK $e');
      throw e;
    }
  }
}
