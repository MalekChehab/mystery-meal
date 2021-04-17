import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';

import '../textformfield.dart';

class SaveCreditCardDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    height: 500,
    decoration: BoxDecoration(
        color: PrimaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(30))),
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/mystery_meal.png',
                height: 100,
                width: 100,
              ),
            ),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                )
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            height: 55,
            child: CustomTextField(
              keyboardType: TextInputType.name,
              icon: Icons.person,
              hint: 'Card Holder Name',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            height: 55,
            child: CustomTextField(
              keyboardType: TextInputType.number,
              icon: Icons.credit_card,
              hint: 'Card Number',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            height: 55,
            child: PasswordTextField(
              keyboardType: TextInputType.number,
              icon: Icons.lock,
              hint: 'CVC',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            height: 55,
            child: CustomTextField(
              keyboardType: TextInputType.text,
              icon: Icons.credit_card,
              hint: 'Exp date',
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
                textColor: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              RaisedButton(
                onPressed:() {
                  return Navigator.of(context).pop(true);
                },
                child: Text('Save'),
                color: Colors.white,
                textColor: PrimaryColor,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              )
            ],
          )
        ],
      ),
    ),
  );
}
