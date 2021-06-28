import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/Provider/user_secure_storage.dart';
import 'custom_dialog.dart';

class LogOutDialog extends StatefulWidget {
  @override
  _LogOutDialogState createState() => _LogOutDialogState();
}

class _LogOutDialogState extends State<LogOutDialog> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      child: CustomDialog(
        text: "Are you sure you want to log out?",
        primaryButton: primaryButton(context),
        showSecondaryButton: true,
      ),
      isLoading: _isLoading,
    );
  }

  Widget primaryButton(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Text(
        "Yes",
        maxLines: 1,
        style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () async{
        print("Sign out");
        setState(() {
          _isLoading = true;
        });
        Future.delayed(Duration(seconds: 1), () async{
          setState(() {
            _isLoading = false;
          });
          Navigator.pop(context);
          await UserSecureStorage.setLogIn('false');
          Navigator.of(context).pushNamedAndRemoveUntil(SIGN_IN, ModalRoute.withName('SIGN'));
        });
      },
    );
  }
}
