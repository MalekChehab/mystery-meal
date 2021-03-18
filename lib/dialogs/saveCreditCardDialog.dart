import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';

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
    height: 400,
    decoration: BoxDecoration(
        color: PrimaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12))),
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/mystery_meal.png',
                height: 120,
                width: 120,
              ),
            ),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Name on card",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Card Number",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "CVC",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Exp date",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
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
                child: Text('No'),
                textColor: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              RaisedButton(
                onPressed: () {
                  return Navigator.of(context).pop(true);
                },
                child: Text('Save'),
                color: Colors.white,
                textColor: PrimaryColor,
              )
            ],
          )
        ],
      ),
    ),
  );
}