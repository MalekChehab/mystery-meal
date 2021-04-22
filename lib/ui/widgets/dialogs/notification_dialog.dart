import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/widgets/custom_textfield.dart';

import 'custom_dialog.dart';

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

enum Options {silent, vibration}

class _NotificationDialogState extends State<NotificationDialog> {

  Widget build(BuildContext context){
    return CustomDialog(
      primaryButtonText: "save",
    );
  }
}
