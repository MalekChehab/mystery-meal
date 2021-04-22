import 'package:flutter/material.dart';
import '../custom_textfield.dart';
import 'custom_dialog.dart';

class SaveCreditCardDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomTextField cardHolder = CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: 'Card Holder Name',
    );
    CustomTextField cardNumber = CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.credit_card_rounded,
      hint: 'Card Number',
    );
    PasswordTextField cvc = PasswordTextField(
      keyboardType: TextInputType.number,
      icon: Icons.lock,
      hint: 'CVC',
      obscureText: true,
    );
    CustomTextField expireDate = CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.date_range_rounded,
      hint: 'Exp date',
    );

    return CustomDialog(textBox1: cardHolder, primaryButtonText: "Save", textBox2: cardNumber, textBox3: cvc, textBox4: expireDate,);
  }
}
