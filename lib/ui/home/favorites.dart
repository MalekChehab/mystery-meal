import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/home/home.dart';
import 'package:mystery_meal/ui/widgets/custom_appbar.dart';
import 'package:mystery_meal/ui/widgets/custom_navigationbar.dart';
import 'package:mystery_meal/ui/widgets/home_view.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  bool _preLoading = true;
  int _selectedItem = 1;
  bool _searching = false;

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
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          centerTitle:true,
          title: Center(
            child: SearchBar(
              isSearching: _searching,
            )
          ),
        actions: [
          IconButton(
            icon: !_searching
                ?Icon(Icons.search_rounded)
                :Icon(Icons.clear_rounded),
            onPressed: (){
              setState(() {
                _searching = !_searching;
              });
            },
            tooltip: 'Search',
          ),
        ],
        elevation: 10,
        automaticallyImplyLeading: false,
        leading: new IconButton(
            icon: new Icon(Icons.location_on_rounded),
            tooltip: "Location",
            onPressed: () {}),
      ),
      body: Center(
        child: _preLoading
            ? CircularProgressIndicator()
            : Container(
                height: _height,
                width: _width,

              ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        defaultSelectedIndex: 1,
        iconList: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(HOME);
            },
            tooltip: 'Home',
          ),
          IconButton(
            icon: Icon(Icons.list_alt_rounded),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => super.widget));
            },
            tooltip: 'Favorites',
          ),
          // IconButton(
          //   icon: Icon(Icons.list_alt_outlined),
          //   onPressed: () {},
          //   tooltip: 'Orders',
          // ),
          IconButton(
            icon: Icon(Icons.settings_rounded),
            onPressed: () {
              Navigator.of(context).pushNamed(SETTINGS);
            },
            tooltip: 'Settings',
          ),
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
