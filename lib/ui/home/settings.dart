import 'package:day_night_switch/day_night_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mystery_meal/constants/dialog_helper.dart';
import 'package:mystery_meal/ui/widgets/custom_navigationbar.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/Provider/themeProvider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isLoading = false;
  int _selectedItem = 3;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _preLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _preLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: LoadingOverlay(
        child: Center(
          child: _preLoading
              ? CircularProgressIndicator()
              :  Container(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30.0),
                  CircleAvatar(
                    radius: 70,
                    // backgroundColor: Colors.teal,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      radius: 67,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/d.jpg'),
                        radius: 63,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    _firebaseAuth.currentUser.displayName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ListTile(
                    title: Text('Theme'),
                    contentPadding: const EdgeInsets.only(left: 16.0),
                    trailing: Transform.scale(
                      scale: 0.34,
                      child: DayNightSwitch(
                          value: themeProvider.isDarkMode,
                          onChanged: (value){
                            final provider = Provider.of<ThemeProvider>(context, listen:false);
                            provider.toggleTheme(value);
                          }),
                    ),
                  ),
                  ListTile(
                    title: Text('Notifications'),
                    trailing: Icon(Icons.keyboard_arrow_right,),
                    onTap: () => DialogHelper.notificationSetting(context),
                  ),
                  ListTile(
                    title: Text("Change password"),
                    trailing: Icon(Icons.keyboard_arrow_right,),
                    onTap: () => DialogHelper.changePassword(context),
                  ),
                  ListTile(
                    title: Text("Change phone number"),
                    trailing: Icon(Icons.keyboard_arrow_right,),
                    onTap: () => DialogHelper.changeNumber(context),
                  ),
                  ListTile(
                    title: Text("Save Credit Card"),
                    trailing: Icon(Icons.keyboard_arrow_right,),
                    onTap: () => DialogHelper.saveCreditCard(context),
                  ),
                  ListTile(
                    title: Text("Delete account"),
                    trailing: Icon(Icons.keyboard_arrow_right,),
                    onTap: () => DialogHelper.deleteAccount(context),
                  ),
                  ListTile(
                    title: Text("Logout", style: TextStyle(color: Colors.red),),
                    trailing: Icon(Icons.warning_amber_rounded, color: Colors.red,),
                    onTap: () => DialogHelper.logOut(context),
                  ),
                ],
              ),
            ),
          ),
        ),
        isLoading: _isLoading,
        opacity: 0.3,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        defaultSelectedIndex: 3,
        iconList: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigator.of(context).pushNamed(HOME);
                Navigator.of(context).pushNamedAndRemoveUntil(HOME, (route) => false);
              }),
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {

              }),
          IconButton(
              icon: Icon(Icons.list_alt_outlined),
              onPressed: () {

              }),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => super.widget));
              })
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
      ),
    );
  }
}
