import 'package:mystery_meal/ui/widgets/dialogs/ChangePhoneNumberDialog.dart';
import 'package:mystery_meal/ui/widgets/dialogs/deleteAccountDialog.dart';
import 'package:mystery_meal/ui/widgets/dialogs/passwordChangeDialog.dart';
import 'package:flutter/material.dart';
import 'package:mystery_meal/ui/widgets/dialogs/saveCreditCardDialog.dart';
import 'notificationDialog.dart';

class DialogHelper {
  static changePassword(context) => showDialog(context: context, builder: (context) => PasswordChangeDialog());
  static deleteAccount(context) => showDialog(context: context, builder: (context) => DeleteAccountDialog());
  static changeNumber(context) => showDialog(context: context, builder: (context) => ChangePhoneNumberDialog());
  static saveCreditCard(context) => showDialog(context: context, builder: (context) => SaveCreditCardDialog());
  static notificationSetting(context) => showDialog(context: context, builder: (context) => NotificationDialog());
}