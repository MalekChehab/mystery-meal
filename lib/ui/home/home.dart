// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/Provider/themeProvider.dart';
import 'package:mystery_meal/ui/widgets/custom_appbar.dart';
import 'package:mystery_meal/ui/widgets/custom_navigationbar.dart';
import 'package:mystery_meal/ui/widgets/home_view.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

var bannerItems = ["Midos", "SandwichWNoss", "Midos", "SandwichWNoss"];
var bannerImage = [
  "images/midos.png",
  "images/sandwichwnos.jpg",
  "images/midos.png",
  "images/sandwichwnos.jpg"
];

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

    Future<List<Widget>> createList() async {
      List<Widget> items = new List<Widget>();
      String dataString =
          await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      dataJSON.forEach((object) {
        String finalString = "";
        List<dynamic> dataList = object["placeItems"];
        dataList.forEach((item) {
          finalString = finalString + item + " | ";
        });

        items.add(Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.0,
                      blurRadius: 5.0),
                ]),
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    object["placeImage"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(object["placeName"]),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Text(
                            finalString,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black54,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          "Min. Order: ${object["minOrder"]}",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      });

      return items;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
            child: SearchBar(
          isSearching: _searching,
        )),
        actions: <Widget>[
          IconButton(
            icon: !_searching ? Icon(Icons.search) : Icon(Icons.clear_rounded),
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
      body: Center(
        child: _preLoading
            ? CircularProgressIndicator()
            : Container(
                height: _height,
                width: _width,
                child: HomeView(),
                //   FutureBuilder(
                //     initialData: <Widget>[Text("")],
                //     future: createList(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return Padding(
                //           padding: EdgeInsets.all(8.0),
                //           child: ListView(
                //             primary: false,
                //             shrinkWrap: true,
                //             children: snapshot.data,
                //           ),
                //         );
                //       } else {
                //         return CircularProgressIndicator();
                //       }
                //     }
                //   ),
                // ],
              ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        defaultSelectedIndex: 0,
        iconList: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => super.widget));
              }),
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: Icon(Icons.list_alt_outlined), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed(SETTINGS);
                // Navigator.of(context).pushNamedAndRemoveUntil(SETTINGS, (route)=>false);
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

class SearchBar extends StatelessWidget {
  final bool isSearching;
  SearchBar({@required this.isSearching});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimateExpansion(
          animate: !isSearching,
          axisAlignment: 1.0,
          child: Text('Mystery Meal'),
        ),
        AnimateExpansion(
          animate: isSearching,
          axisAlignment: -1.0,
          child: Search(),
        ),
      ],
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search for...',
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.white.withOpacity(.5),
        ),
      ),
    );
  }
}

class AnimateExpansion extends StatefulWidget {
  final Widget child;
  final bool animate;
  final double axisAlignment;
  AnimateExpansion({
    this.animate = false,
    this.axisAlignment,
    this.child,
  });

  @override
  _AnimateExpansionState createState() => _AnimateExpansionState();
}

class _AnimateExpansionState extends State<AnimateExpansion>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  void prepareAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInCubic,
      reverseCurve: Curves.easeOutCubic,
    );
  }

  void _toggle() {
    if (widget.animate) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _toggle();
  }

  @override
  void didUpdateWidget(AnimateExpansion oldWidget) {
    super.didUpdateWidget(oldWidget);
    _toggle();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axis: Axis.horizontal,
        axisAlignment: -1.0,
        sizeFactor: _animation,
        child: widget.child);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
