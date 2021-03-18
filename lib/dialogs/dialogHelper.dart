import 'package:mystery_meal/dialogs/ChangePhoneNumberDialog.dart';
import 'package:mystery_meal/dialogs/deleteAccountDialog.dart';
import 'package:mystery_meal/dialogs/passwordChangeDialog.dart';
import 'package:flutter/material.dart';
import 'package:mystery_meal/dialogs/saveCreditCardDialog.dart';

class DialogHelper {
  static changePassword(context) => showDialog(context: context, builder: (context) => PasswordChangeDialog());
  static deleteAccount(context) => showDialog(context: context, builder: (context) => DeleteAccountDialog());
  static changeNumber(context) => showDialog(context: context, builder: (context) => ChangePhoneNumberDialog());
  static saveCreditCard(context) => showDialog(context: context, builder: (context) => SaveCreditCardDialog());
}