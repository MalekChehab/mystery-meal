import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom_textfield.dart';
import 'custom_dialog.dart';

class PasswordChangeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PasswordTextField currentPassword = PasswordTextField(
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.lock,
      obscureText: true,
      hint: 'Current Password',
    );
    PasswordTextField newPassword = PasswordTextField(
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.lock,
      obscureText: true,
      hint: 'New Password',
    );
    return CustomDialog(textBox1: currentPassword, primaryButtonText: "Change", text: null, textBox2: newPassword,);
  }
}
