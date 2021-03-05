import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/widgets/customnavigationbar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var bannerItems = ["Midos", "SandwichWNoss", "Midos", "SandwichWNoss"];
var bannerImage = [
  "images/midos.png",
  "images/sandwichwnos.jpg",
  "images/midos.png",
  "images/sandwichwnos.jpg"
];

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items = new List<Widget>();
      String dataString =
      await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      dataJSON.forEach((object) {

        String finalString= "";
        List<dynamic> dataList = object["placeItems"];
        dataList.forEach((item){
          finalString = finalString + item + " | ";
        });

        items.add(Padding(padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.0,
                      blurRadius: 5.0
                  ),
                ]
            ),
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(object["placeImage"],width: 80,height: 80,fit: BoxFit.cover,),
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
                          padding: const EdgeInsets.only(top: 2.0,bottom: 2.0),
                          child: Text(finalString,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12.0,color: Colors.black54,),maxLines: 1,),
                        ),
                        Text("Min. Order: ${object["minOrder"]}",style: TextStyle(fontSize: 12.0,color: Colors.black54),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),));
      });

      return items;
    }

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.fastfood), onPressed: (){}),
                        Text(
                          "Mystery Meal",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        IconButton(icon: Icon(Icons.notifications), onPressed: () {})
                      ],
                    ),
                  ),

                  Container(
                    child: FutureBuilder(
                        initialData: <Widget>[Text("")],
                        future: createList(),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ListView(
                                primary: false,
                                shrinkWrap: true,
                                children: snapshot.data,
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  )
                ],
              ),
            )),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          IconButton(icon: Icon(Icons.home), onPressed: (){Navigator.of(context).pushNamed(HOME_PAGE);}),
          IconButton(icon: Icon(Icons.favorite), onPressed: (){Navigator.of(context).pushNamed(STORE_DETAILS);}),
          IconButton(icon: Icon(Icons.list_alt_outlined), onPressed: (){}),
          IconButton(icon: Icon(Icons.settings), onPressed: (){Navigator.of(context).pushNamed(SETTINGS);})
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 0,
      ),

    );
  }
}