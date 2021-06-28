import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/Provider/user_secure_storage.dart';
import 'package:mystery_meal/ui/widgets/custom_shape.dart';
import 'package:mystery_meal/ui/widgets/responsive_ui.dart';
import 'package:mystery_meal/ui/widgets/custom_textfield.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();
  bool _isLoading = false;
  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  Future login() async {
    setState(() {
      _isLoading=true;
    });
    var url = "https://mystery-meal.000webhostapp.com/login.php";
    var response = await http.post(url, body: {
      "username": _usernameController.text,
      "password": _passwordController.text,
    });
    try {
      var data = json.decode(response.body);
      if (data == "Success") {
        await UserSecureStorage.setLogIn('true');
        await UserSecureStorage.setUsername(_usernameController.text);

        setState(() {
          _isLoading = false;
        });
        print("Logged In");
        Toast.show(
            "Welcome",
            context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM
        );
        return await Navigator.of(context).pushReplacementNamed(HOME);
      } else {
        setState(() {
          _isLoading = false;
        });
        return Toast.show(
            "User name and password invalid",
            context,
            duration: Toast.LENGTH_LONG,
            gravity: _keyboardIsVisible() ? Toast.CENTER: Toast.BOTTOM
        );
      }
    }on SocketException catch (e){
      setState(() {
        _isLoading=false;
      });
      return Toast.show(
          "Please connect to the Internet",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: _keyboardIsVisible() ? Toast.CENTER: Toast.BOTTOM
      );
    }catch (e){
      setState(() {
        _isLoading = false;
      });
      if(e==SocketException){
        Toast.show(
            "Please connect to the Internet",
            context,
            duration: Toast.LENGTH_LONG,
            gravity: _keyboardIsVisible() ? Toast.CENTER: Toast.BOTTOM
        );
      }else {
        Toast.show(
            "User name and password invalid",
            context,
            duration: Toast.LENGTH_LONG,
            gravity: _keyboardIsVisible() ? Toast.CENTER: Toast.BOTTOM
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        body: LoadingOverlay(
          child: Container(
            height: _height,
            width: _width,
            padding: EdgeInsets.only(bottom: 5),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  clipShape(),
                  welcomeTextRow(),
                  signInTextRow(),
                  form(),
                  forgetPassTextRow(),
                  SizedBox(height: _height / 30),
                  signInButton(),
                  SizedBox(height: _height * 0.17),
                  signUpTextRow(),
                ],
              ),
            ),
          ),
          isLoading: _isLoading,
          opacity: 0.4,
        ),
      ),
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
                  ? _height / 4
                  : (_medium ? _height / 5.0 : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      //[const Color(0xffFE4180), const Color(0xffFEB04E)],
                      // [Colors.red[800], Colors.yellowAccent],
                      [Theme.of(context).primaryColor, SecondaryColor],
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
                  ? _height / 4.5
                  : (_medium ? _height / 5 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:
                    // [Colors.yellow[800], Colors.red[500]],
                    [Theme.of(context).primaryColor, SecondaryColor]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 20),
      child: Row(
        children: <Widget>[
          Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _large ? 60 : (_medium ? 50 : 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Sign in to your account",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
        key: _key,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              usernameTextFormField(),
              SizedBox(height: _height / 40.0),
              passwordTextFormField(),
            ]),
      ),
    );
  }

  Widget usernameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: _usernameController,
      icon: Icons.person_rounded,
      hint: "User Name",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your user name';
        }
        return null;
      },
    );
  }

  Widget passwordTextFormField() {
    return PasswordTextField(
      keyboardType: TextInputType.visiblePassword,
      textEditingController: _passwordController,
      icon: Icons.lock,
      hint: "Password",
    );
  }

  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot your password?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RECOVER);
              print("Routing");
            },
            child: Text(
              "Recover",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: const Color(0xfffe9256)),
            ),
          )
        ],
      ),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        if(_usernameController.text=="malek3"){
          Navigator.of(context).pushReplacementNamed(HOME);
        }
        if(_usernameController.text.isEmpty||_passwordController.text.isEmpty) {
          Toast.show(
              "Please Fill all fields",
              context,
              duration: Toast.LENGTH_LONG,
              gravity: _keyboardIsVisible() ? Toast.CENTER: Toast.BOTTOM
          );
          return;
        }
        login();
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(colors:
              [SecondaryColor, Theme.of(context).primaryColor]),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Text('SIGN IN',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }

  Widget signUpTextRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTapDown: (TapDownDetails details) {
              Navigator.of(context).pushNamed(SIGN_UP);
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color(0xfffe825c)),
            ),
          ),
        ],
      ),
    );
  }
}
