import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/widgets/custom_textfield.dart';
import 'custom_dialog.dart';

class LogOutDialog extends StatefulWidget {
  @override
  _LogOutDialogState createState() => _LogOutDialogState();
}

class _LogOutDialogState extends State<LogOutDialog> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      child: CustomDialog(
        text: "Are you sure you want to log out?",
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
        "Yes",
        maxLines: 1,
        style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {
        print("Sign out");
        setState(() {
          _isLoading = true;
        });
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _isLoading = false;
          });
          Navigator.pop(context);
          _auth.signOut();
          Navigator.of(context).pushReplacementNamed(SIGN_IN);
        });
      },
    );
  }

  logOut() {

    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

    });
  }
}
