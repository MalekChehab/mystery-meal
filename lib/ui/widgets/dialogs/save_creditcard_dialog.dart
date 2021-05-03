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

    return CustomDialog(textBox1: cardHolder, primaryButton: primaryButton(context), textBox2: cardNumber, textBox3: cvc, textBox4: expireDate,);
  }

  Widget primaryButton(BuildContext context){
    return RaisedButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)),
      child: Text(
        "Save",
        maxLines: 1,
        style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {
        final snackBar = SnackBar(
            content: Text('Credit card saved'), backgroundColor: Theme.of(context).primaryColor,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("Credit card saved");
        Navigator.pop(context);
      },
    );
  }
}
