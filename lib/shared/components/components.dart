import 'package:flutter/material.dart';

ShowMessage({
  required BuildContext context,
  required String title,
  required String content,
  required String postiveBtnMsg,
  required VoidCallback postiveAct,
  String? negativeBtnMsg,
  VoidCallback? negativeAct,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      List<Widget> actions = [
        TextButton(onPressed: postiveAct, child: Text(postiveBtnMsg)),
      ];
      if (negativeBtnMsg != null && negativeAct != null) {
        actions.add(
          TextButton(
            onPressed: negativeAct,
            child: Text(negativeBtnMsg),
          ),
        );
      }
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: actions,
      );
    },
  );
}

hideMessage(BuildContext context) {
  Navigator.pop(context);
}
