import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/widgets/textformfield.dart';

class ChangePhoneNumberDialog extends StatelessWidget {
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
    height: 370,
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
              keyboardType: TextInputType.phone,
              icon: Icons.phone_android,
              hint: 'Old Phone Number',
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            height: 55,
            child: CustomTextField(
              keyboardType: TextInputType.phone,
              icon: Icons.phone_android,
              hint: 'New Phone Number',
            ),
          ),
          SizedBox(
            height: 20,
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
                child: Text('Change'),
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
