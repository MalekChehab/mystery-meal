import 'package:flutter/material.dart';
import 'package:mystery_meal/ui/widgets/customnavigationbar.dart';
import 'package:mystery_meal/constants/constants.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _selectedItem = 3;
  static final String path = "lib/src/pages/settings/settings2.dart";
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyTExt = TextStyle(
    color: Colors.grey.shade400,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Theme(
        data: Theme.of(context).copyWith(
          brightness: Brightness.dark,
          primaryColor: Colors.purple,
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: new AssetImage('assets/images/d.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mohammad Ghandour",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.black87),
                          ),
                          Text(
                            "Lebanon",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ListTile(
                  title: Text("Languages"),
                  subtitle: Text(
                    "English US",
                    style: greyTExt,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Change password"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Change phone number"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Delete account"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
                  trailing: Icon(
                    Icons.warning_amber_rounded,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushNamed(HOME);
              }),
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: Icon(Icons.list_alt_outlined), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed(SETTINGS);
              })
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        // defaultSelectedIndex: 3,
      ),
    );
  }
}
