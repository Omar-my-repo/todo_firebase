import 'package:flutter/material.dart';

class ModalBottomSheet extends StatefulWidget {
  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          Text(
            '12-12-122',
            style:
                Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('done=================');
                Navigator.pop(context);
              }
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
}
