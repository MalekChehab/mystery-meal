import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget textBox1, textBox2, textBox3, textBox4;
  final String text;
  final String primaryButtonText;
  final String destination;

  CustomDialog({
    this.textBox1,
    @required this.primaryButtonText,
    this.text,
    this.textBox2,
    this.textBox3,
    this.textBox4,
    this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        // height: 370,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
              showText(context),
              SizedBox(height: 20),
              showTextBox(context, textBox1),
              SizedBox(height: 10.0),
              showTextBox(context, textBox2),
              SizedBox(height: 10.0),
              showTextBox(context, textBox3),
              SizedBox(height: 10.0),
              showTextBox(context, textBox4),
              SizedBox(height: 5.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlatButton(
                    onPressed: () {
                      return Navigator.of(context).pop(true);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                  ),
                  RaisedButton(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text(
                      primaryButtonText,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      buttonOnPressed(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttonOnPressed(BuildContext context) {
    return Navigator.of(context).pop(true);
    //change in database
  }

  showTextBox(BuildContext context, Widget textBox) {
    if (textBox != null) {
      return Container(
          padding: const EdgeInsets.only(right: 10, left: 10),
          height: 55,
          child: textBox);
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }

  showText(BuildContext context) {
    if (text != null) {
      return Column(
        children: [
          SizedBox(height: 15),
          Container(
            child: Text(
              "Please enter your password to proceed",
              style: TextStyle(
                fontSize: 19,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            margin: new EdgeInsets.only(right: 10, left: 20, bottom: 10),
          ),
        ],
      );
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }
}
