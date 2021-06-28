import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/widgets/custom_shape.dart';
import 'package:mystery_meal/ui/widgets/custom_appbar.dart';
import 'package:mystery_meal/ui/widgets/responsive_ui.dart';
import 'package:mystery_meal/ui/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey<FormState> _key = GlobalKey();
  // final auth = FirebaseAuth.instance;
  bool _isButtonEnabled = false;
  bool _isLoading = false;
  File _image;
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  signup(firstname, lastname, username, email, password) async {
    setState(() {
      _isLoading = true;
    });
    print("Calling");
    Map data = {
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
    };
    print(data.toString());
    var url = "https://mystery-meal.000webhostapp.com/register.php";
    final response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));
    var body = await json.decode(json.encode(response.body));
    try {
      if (response.statusCode == 200) {
        print(body.runtimeType);
        print(body);
        if (body[9] == 't') {
          setState(() {
            _isLoading = false;
          });
          Toast.show(body.toString().substring(25, 48), context,
              duration: Toast.LENGTH_LONG,
              gravity: _keyboardIsVisible() ? Toast.CENTER : Toast.BOTTOM);
        }
        if (body[9] != 't') {
          print("success");
          setState(() {
            _isLoading = false;
          });
          Toast.show("User Registered Successfully", context,
              duration: Toast.LENGTH_LONG,
              gravity: _keyboardIsVisible() ? Toast.CENTER : Toast.BOTTOM);
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pushNamed(SIGN_IN);
          });
        } else {
          print(" ${body[1]}");
        }
      } else {
        Toast.show("Please Try again", context,
            duration: Toast.LENGTH_LONG,
            gravity: _keyboardIsVisible() ? Toast.CENTER : Toast.BOTTOM);
      }
    } on SocketException catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
              "Please make sure you are connected to the Internet and try again")));
      return null;
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Container(
                  child: new Wrap(
            children: [
              new ListTile(
                leading: new Icon(Icons.photo_library_rounded),
                title: new Text('Gallery'),
                onTap: () {
                  _imgFromGallery();
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                leading: new Icon(Icons.photo_camera_rounded),
                title: new Text('Camera'),
                onTap: () {
                  _imgFromCamera();
                  Navigator.pop(context);
                },
              )
            ],
          )));
        });
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
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: LoadingOverlay(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Opacity(opacity: 0.88, child: CustomAppBar()),
                  clipShape(),
                  form(),
                  acceptTermsTextRow(),
                  SizedBox(
                    height: _height / 35,
                  ),
                  signUpButton(),
                  // signInTextRow()
                ],
              ),
            ),
            isLoading: _isLoading,
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Theme.of(context).primaryColor, SecondaryColor]),
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
                gradient: LinearGradient(
                    colors: [Theme.of(context).primaryColor, SecondaryColor]),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 55,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: _image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.file(
                      _image,
                      width: 190,
                      height: 190,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                : Icon(
                    Icons.photo_camera_rounded,
                    size: _large ? 40 : (_medium ? 33 : 31),
                    color: Theme.of(context).primaryColor,
                  ),
          ),
        ),
        Positioned(
          top: _height / 8,
          left: _width / 1.75,
          child: Container(
            alignment: Alignment.center,
            height: _height / 23,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
                print('Adding photo');
              },
              child: Icon(
                Icons.add_a_photo,
                size: _large ? 22 : (_medium ? 15 : 13),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            usernameTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      textEditingController: _firstnameController,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "First Name",
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      textEditingController: _lastnameController,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Last Name",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      textEditingController: _emailController,
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email",
    );
  }

  Widget usernameTextFormField() {
    return CustomTextField(
      textEditingController: _usernameController,
      keyboardType: TextInputType.text,
      icon: Icons.person_outline_rounded,
      hint: "Username",
    );
  }

  Widget passwordTextFormField() {
    return PasswordTextField(
      textEditingController: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.lock,
      hint: "Password",
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.teal,
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                  _isButtonEnabled = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: _isButtonEnabled
              ? LinearGradient(
                  colors: [SecondaryColor, Theme.of(context).primaryColor])
              : LinearGradient(
                  colors: [Colors.grey, Colors.grey],
                ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'SIGN UP',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: _isButtonEnabled
          ? () {
              if (_isLoading) {
                return;
              }
              if (_firstnameController.text.isEmpty) {
                Toast.show("Please Enter Name", context,
                    duration: Toast.LENGTH_LONG,
                    gravity:
                        _keyboardIsVisible() ? Toast.CENTER : Toast.BOTTOM);
                return;
              }
              if (_lastnameController.text.isEmpty) {
                Toast.show("Please Enter Last Name", context,
                    duration: Toast.LENGTH_LONG,
                    gravity:
                    _keyboardIsVisible() ? Toast.CENTER : Toast.BOTTOM);
                return;
              }
              if (_usernameController.text.isEmpty) {
                Toast.show("Please Enter Username", context,
                    duration: Toast.LENGTH_LONG,
                    gravity:
                    _keyboardIsVisible() ? Toast.CENTER : Toast.BOTTOM);
                return;
              }
              if (!reg.hasMatch(_emailController.text)) {
                Toast.show("Enter Valid Email", context,
                    duration: Toast.LENGTH_LONG,
                    gravity:
                        _keyboardIsVisible() ? Toast.CENTER : Toast.BOTTOM);
                return;
              }
              if (_passwordController.text.isEmpty ||
                  _passwordController.text.length < 6) {
                Toast.show("Password should be min 6 characters", context,
                    duration: Toast.LENGTH_LONG,
                    gravity:
                        _keyboardIsVisible() ? Toast.CENTER : Toast.BOTTOM);
                return;
              }
              try {
                signup(
                    _firstnameController.text,
                    _lastnameController.text,
                    _usernameController.text,
                    _emailController.text,
                    _passwordController.text);
              } on Exception catch (e) {
                print(e);
                Toast.show(e.toString(), context,
                    duration: Toast.LENGTH_LONG,
                    gravity:
                        _keyboardIsVisible() ? Toast.CENTER : Toast.BOTTOM);
              }
            }
          : null,
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(SIGN_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
