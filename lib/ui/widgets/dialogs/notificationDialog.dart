import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

enum Options {silent, vibration}

class _NotificationDialogState extends State<NotificationDialog> {
  // Options? _option = Options.vibration;
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
          // ListTile(
          //   title: const Text('vibration'),
          //   leading: Radio<Options>(
          //     value: Options.vibration,
          //     groupValue: _option,
          //     onChanged: (Options? value) {
          //       setState(() {
          //         _option = value;
          //       });
          //     },
          //   ),
          // ),
          // ListTile(
          //   title: const Text('Silent'),
          //   leading: Radio<Options>(
          //     value: Options.silent,
          //     groupValue: _option,
          //     onChanged: (Options? value) {
          //       setState(() {
          //         _option = value;
          //       });
          //     },
          //   ),
          // ),
        ],
      ),
    ),
  );
}
