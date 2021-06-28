import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/constants/dialog_helper.dart';
import 'package:mystery_meal/ui/widgets/custom_textfield.dart';
import 'custom_dialog.dart';

class DeleteAccountDialog extends StatefulWidget {
  @override
  _DeleteAccountDialogState createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    PasswordTextField password = PasswordTextField(
      textEditingController: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.lock,
      hint: 'Password',
      obscureText: true,
    );
    return LoadingOverlay(
      child: CustomDialog(
        textBox1: password,
        text: "Please enter your password to proceed",
        primaryButton: primaryButton(context),
      ),
      isLoading: _isLoading,
    );
  }

  Widget primaryButton(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Text(
        "Delete",
        maxLines: 1,
        style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {
        //code
        setState(() {
          _isLoading = true;
        });
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _isLoading = false;
          });
          DialogHelper.goodBye(context);
          Future.delayed(Duration(seconds: 5), () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacementNamed(SIGN_IN);
          });
        });
        print("Account Deleted");
      },
    );
  }
}

class GoodByeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      text: "We are sorry to see you go!",
      showSecondaryButton: false,
    );
  }
}
