import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/Provider/user_secure_storage.dart';
import 'package:mystery_meal/ui/home/home.dart';
import 'package:mystery_meal/ui/widgets/custom_appbar.dart';
import 'package:mystery_meal/ui/widgets/custom_navigationbar.dart';
import 'package:mystery_meal/ui/widgets/home_view.dart';
import 'package:mystery_meal/ui/widgets/order.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  bool _preLoading = true;
  int _selectedItem = 1;
  bool _searching = false;
  String username='';

  @override
  void initState() {
    super.initState();
    init();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _preLoading = false;
        // dispose();
      });
    });
  }
  Future init() async{
    username = await UserSecureStorage.getUsername();
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
      body:Center(
        child: Container(
          child: new FutureBuilder<List<Order>>(
            future: ordersDownloadJSON(username),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Order> orders = snapshot.data;
                return new OrdersListView(orders);
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
      //     child: Center(
      //       child: OrdersListView(widget.orders),
      //     ),
      //         ),
      // ),

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

