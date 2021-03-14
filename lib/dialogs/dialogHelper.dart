import 'package:mystery_meal/dialogs/passwordChangeDialog.dart';
import 'package:flutter/material.dart';

class DialogHelper {

  static changePassword(context) => showDialog(context: context, builder: (context) => PasswordChangeDialog());
}