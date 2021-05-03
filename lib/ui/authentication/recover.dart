import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/widgets/custom_shape.dart';
import 'package:mystery_meal/ui/widgets/responsive_ui.dart';
import 'package:mystery_meal/ui/widgets/custom_textfield.dart';
import 'package:mystery_meal/ui/widgets/custom_appbar.dart';

class RecoverPassword extends StatefulWidget {
  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
        child: Scaffold(
          body: Container(
            height: _height,
            width: _width,
            padding: EdgeInsets.only(bottom: 5),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Opacity(opacity: 0.88, child: CustomAppBar()),
                  clipShape(),
                  forgotTextRow(),
                  linkTextRow(),
                  form(),
                  SizedBox(height: _height / 30),
                  sendButton(),
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.8,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, SecondaryColor],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Theme.of(context).primaryColor, SecondaryColor]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget forgotTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 20),
      child: Row(
        children: <Widget>[
          Text(
            "Forgot your password?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _large ? 30 : (_medium ? 20 : 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget linkTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0, top: 20),
      child: Row(
        children: <Widget>[
          Text(
            "A link will be sent to your email \nin order to reset your password\n\nEnter your Email:",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: _large ? 20 : (_medium ? 20 : 17),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 30.0),
      child: Form(
          key: _key,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                emailTextFormField(),
                SizedBox(height: _height / 40.0),
              ])),
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      icon: Icons.email,
      hint: "Email",
      // obscureText: false,
    );
  }

  Widget sendButton() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {},
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(colors:
              // <Color>[Colors.red[600], Colors.yellow[400]],
              [Theme.of(context).primaryColor, SecondaryColor]),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Text('SEND',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }
}
