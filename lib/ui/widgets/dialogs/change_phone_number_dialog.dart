import 'package:flutter/material.dart';
import 'package:mystery_meal/ui/widgets/dialogs/custom_dialog.dart';
import '../custom_textfield.dart';

class ChangePhoneNumberDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CustomTextField oldPhone = CustomTextField(
      keyboardType: TextInputType.phone,
      icon: Icons.phone_android,
      hint: 'Old Phone Number',
    );
    CustomTextField newPhone = CustomTextField(
        keyboardType: TextInputType.phone,
        icon: Icons.phone_android,
        hint: 'New Phone Number',
    );
    return CustomDialog(textBox1: oldPhone, text: null, textBox2: newPhone, primaryButton: primaryButton(context),);
  }

  Widget primaryButton(BuildContext context){
    return RaisedButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)),
      child: Text(
        "Change",
        maxLines: 1,
        style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {

        print("Phone number changed");
        Navigator.pop(context);
      },
    );
  }

}
