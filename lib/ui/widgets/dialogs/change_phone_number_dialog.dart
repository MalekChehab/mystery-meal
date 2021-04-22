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
    return CustomDialog(textBox1: oldPhone, primaryButtonText: "Change", text: null, textBox2: newPhone,);
  }
}
