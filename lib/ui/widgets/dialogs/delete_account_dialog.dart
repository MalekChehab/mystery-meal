import 'package:flutter/material.dart';
import 'package:mystery_meal/ui/widgets/custom_textfield.dart';
import 'custom_dialog.dart';

class DeleteAccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PasswordTextField password = PasswordTextField(
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.lock,
      hint: 'Password',
      obscureText: true,
    );
    return CustomDialog(textBox1: password, primaryButtonText: "Delete", text: "Please enter your password to proceed",);
  }
}
