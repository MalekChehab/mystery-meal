import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/models/store.dart';
import 'package:mystery_meal/ui/Provider/theme_provider.dart';
import 'package:mystery_meal/ui/widgets/custom_appbar.dart';
import 'package:mystery_meal/ui/widgets/custom_navigationbar.dart';
import 'package:mystery_meal/ui/widgets/home_view.dart';
import 'package:mystery_meal/ui/widgets/item.dart';
import 'package:mystery_meal/ui/widgets/store.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  //for example{
  Store store1 = Store(id: "1",s_name: "sousa", s_address: "Beirut", s_category: "Burgers", s_phone:  "1234", s_close_time: "11");
  List<Store> stores=[];
  //}
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _preLoading = true;
  int _selectedItem = 0;
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

    widget.stores.add(widget.store1);     //for example

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
            child: SearchBar(
          isSearching: _searching,
        )),
        actions: <Widget>[
          IconButton(
            icon: !_searching
                ? Icon(Icons.search_rounded)
                : Icon(Icons.clear_rounded),
            onPressed: () {
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
      body:
          Center(
            child: Container(
              child: new FutureBuilder<List<Store>>(
                future: storesDownloadJSON(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Store> stores = snapshot.data;
                    return new StoresListView(stores);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  //return  a circular progress indicator.
                  return new CircularProgressIndicator();
                },
              ),
            ),
          ),
      
          // Center(
          //   child: _preLoading
          //       ? CircularProgressIndicator()
          //       : Container(
          //           height: _height,
          //           width: _width,
          //           child: Center(
          //             child: StoresListView(widget.stores),
          //           ),
          //         ),
          // ),
      bottomNavigationBar: CustomBottomNavigationBar(
        defaultSelectedIndex: 0,
        iconList: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => super.widget));
              }),
          IconButton(
              icon: Icon(Icons.list_alt_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed(ORDERS);
              }),
          IconButton(
              icon: Icon(Icons.settings_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed(SETTINGS);
                // Navigator.of(context).pushNamedAndRemoveUntil(SETTINGS, (route)=>false);
              }),
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
      ),
    );
  }

  void shuffle(List elements, [int start = 0, int end, Random random]) {
    random ??= Random();
    end ??= elements.length;
    var length = end - start;
    while (length > 1) {
      var pos = random.nextInt(length);
      length--;
      var tmp1 = elements[start + pos];
      elements[start + pos] = elements[start + length];
      elements[start + length] = tmp1;
    }
  }
}
