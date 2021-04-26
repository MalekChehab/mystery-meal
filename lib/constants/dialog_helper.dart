import 'package:mystery_meal/ui/widgets/dialogs/change_phone_number_dialog.dart';
import 'package:mystery_meal/ui/widgets/dialogs/delete_account_dialog.dart';
import 'package:mystery_meal/ui/widgets/dialogs/change_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mystery_meal/ui/widgets/dialogs/log_out_dialog.dart';
import 'package:mystery_meal/ui/widgets/dialogs/save_creditcard_dialog.dart';
import '../ui/widgets/dialogs/notification_dialog.dart';

class DialogHelper {

  static changePassword(context) => showDialog(context: context, builder: (context) => PasswordChangeDialog());
  static deleteAccount(context) => showDialog(context: context, builder: (context) => DeleteAccountDialog());
  static changeNumber(context) => showDialog(context: context, builder: (context) => ChangePhoneNumberDialog());
  static saveCreditCard(context) => showDialog(context: context, builder: (context) => SaveCreditCardDialog());
  static notificationSetting(context) => showDialog(context: context, builder: (context) => NotificationDialog());
  static logOut(context) => showDialog(context: context, builder: (context) => LogOutDialog());
  static goodBye(context) => showDialog(context: context, builder: (context) => GoodByeDialog());
}