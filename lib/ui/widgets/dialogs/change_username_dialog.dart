import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/home/settings.dart';
import 'package:mystery_meal/ui/widgets/custom_textfield.dart';
import 'custom_dialog.dart';

class ChangeUserNameDialog extends StatelessWidget {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  FlutterSecureStorage _localStorage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    // _firstNameController = TextEditingController(text:_auth.currentUser.displayName.split(" ")[0]);
    // _lastNameController = TextEditingController(text: _auth.currentUser.displayName.split(" ").sublist(1).join(" "));
    return CustomDialog(
      key: _key,
      textBox1: CustomTextField(
        textEditingController: _firstNameController,
        keyboardType: TextInputType.name,
        icon: Icons.person,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a first name";
          }
          return null;
        },
      ),
      textBox2: CustomTextField(
        textEditingController: _lastNameController,
        keyboardType: TextInputType.name,
        icon: Icons.person,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a first name";
          }
          return null;
        },
      ),
      showSecondaryButton: true,
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

          print("UserName Changed");
          Navigator.pushReplacementNamed(context, SETTINGS);
      },
    );
  }
}
