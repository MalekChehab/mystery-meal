import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom_textfield.dart';
import 'custom_dialog.dart';

class PasswordChangeDialog extends StatelessWidget {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _oldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PasswordTextField currentPassword = PasswordTextField(
      textEditingController: _oldPasswordController,
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.lock,
      obscureText: true,
      hint: 'Current Password',
    );
    PasswordTextField newPassword = PasswordTextField(
      textEditingController: _newPasswordController,
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.lock,
      obscureText: true,
      hint: 'New Password',
    );
    return CustomDialog(
      textBox1: currentPassword,
      text: null,
      textBox2: newPassword,
      primaryButton: primaryButton(context),
    );
  }

  Widget primaryButton(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Text(
        "Change",
        maxLines: 1,
        style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {
        onPressed(context);
      },
    );
  }

  onPressed(BuildContext context) {
    Navigator.pop(context);
    print("Password Changed");
  }
}
