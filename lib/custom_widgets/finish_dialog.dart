import 'package:flutter/material.dart';

class FinishDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  FinishDialog(this.title, this.content, this.callback,
      [this.actionText = "Ok"]);
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: <Widget>[
        new FlatButton(
          onPressed: callback,
          color: Colors.white,
          child: new Text(actionText),
        )
      ],
    );
  }
}
