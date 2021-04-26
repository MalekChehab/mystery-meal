import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget textBox1, textBox2, textBox3, textBox4, primaryButton;
  final String text;
  bool showSecondaryButton;

  CustomDialog({
    this.textBox1,
    this.text,
    this.textBox2,
    this.textBox3,
    this.textBox4,
    this.primaryButton,
    this.showSecondaryButton = true,
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
              // SizedBox(height: 10.0),
              showTextBox(context, textBox2),
              // SizedBox(height: 10.0),
              showTextBox(context, textBox3),
              // SizedBox(height: 10.0),
              showTextBox(context, textBox4),
              // SizedBox(height: 5.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  showCancelButton(context),
                  showPrimaryButton(context),
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

  showPrimaryButton(BuildContext context){
    if(this.primaryButton != null){
      return this.primaryButton;
    }else{
      return SizedBox(height: 10);
    }
  }

  showCancelButton(BuildContext context){
    if(showSecondaryButton == true) {
      return FlatButton(
        onPressed: () {
          return Navigator.of(context).pop(true);
        },
        child: Text(
          "Cancel",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme
                  .of(context)
                  .scaffoldBackgroundColor),
        ),
      );
    }else{
      return SizedBox(height: 0,);
    }
  }

  showTextBox(BuildContext context, Widget textBox) {
    if (textBox != null) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10, left: 10),
              height: 55,
              child: textBox,
            ),
            SizedBox(height: 10,),
          ],
        ),
      );
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
            child: Text(text,
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


