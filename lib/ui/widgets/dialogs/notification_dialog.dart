import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'custom_dialog.dart';

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

enum Options {silent, vibration}

class _NotificationDialogState extends State<NotificationDialog> {

  Widget build(BuildContext context){
    return CustomDialog(
      text: "this is not yet implemented",
      // primaryButton: primaryButton(context),
      showSecondaryButton: false,
    );
  }
  Widget primaryButton(BuildContext context){
    return RaisedButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)),
      child: Text(
        "Save",
        maxLines: 1,
        style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {

        print("");
        Navigator.pop(context);
      },
    );
  }

}
