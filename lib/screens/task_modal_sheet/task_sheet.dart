import 'package:flutter/material.dart';
import 'package:route_todoapp/screens/task_modal_sheet/task_sheet_navigator.dart';
import 'package:route_todoapp/screens/task_modal_sheet/task_sheet_vm.dart';
import 'package:route_todoapp/shared/components/utils.dart' as utils;

class TaskSheet extends StatefulWidget {
  @override
  State<TaskSheet> createState() => _TaskSheetState();
}

class _TaskSheetState extends State<TaskSheet> implements TaskSheetNavigator {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TaskSheetViewModel viewModel = TaskSheetViewModel();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'add new task',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'title is required';
                    }
                    return null;
                  },
                  controller: title,
                  decoration: InputDecoration(
                    label: Text('task title'),
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black45),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                // SizedBox(height: 8),
                TextFormField(
                  controller: description,
                  maxLines: 3,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'task description is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('task description'),
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black45),
                    alignLabelWithHint: true,
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14),
          Text(
            'Select Date',
            style:
                Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 14),
          InkWell(
            onTap: () {
              selectDate();
            },
            child: Text(
              '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 14),
          ElevatedButton(
            onPressed: () {
              validationFunction();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Add task',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 14),
        ],
      ),
    );
  }

  validationFunction() {
    if (_formKey.currentState!.validate()) {
      viewModel.addTaskToFireStore(title.text, description.text,
          DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
    }
  }

  selectDate() async {
    DateTime? chossenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (chossenDate == null) return;
    selectedDate = chossenDate;
    setState(() {});
  }

  @override
  void hideLoading() {
    utils.hideDialog(context);
  }

  @override
  void navigateBack() {
    utils.hideDialog(context);
  }

  @override
  void showLoading() {
    utils.showLoading(context);
  }

  @override
  void showMessage(String message) {
    utils.sowMessage(context, message);
  }
}
