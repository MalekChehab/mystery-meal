import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/models/category.dart';
import 'package:mystery_meal/models/storeCard.dart';

class SwipeList extends StatefulWidget {
  final String name;

  // String location;

  SwipeList(this.name);

  @override
  _ListItemWidget createState() => _ListItemWidget();
}

class _ListItemWidget extends State<SwipeList> {
  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(items[index]),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });
          },
          direction: DismissDirection.endToStart,
          child: Card(
            elevation: 5,
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/d.jpg'),
                          // image: NetworkImage("https://is2-ssl.mzstatic.com/image/thumb/Video2/v4/e1/69/8b/e1698bc0-c23d-2424-40b7-527864c94a8e/pr_source.lsr/268x0w.png")
                        )),
                  ),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            items[index],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                            child: Container(
                              width: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.teal),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "3D",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                            child: Container(
                              width: 260,
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 48, 48, 54)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}

Widget image() {
  return Image(image: AssetImage("images/midos.png"));
}

class HomeView extends StatelessWidget {
  final List<StoreCard> storesList = [
    StoreCard("Kalaa", [Category("Fast Food"), Category("Burger")],
        Image(image: AssetImage("assets/images/midos.png")), 4.4),
    StoreCard("Sousa", [Category("Fast Food"), Category("BBQ")],
        Image(image: AssetImage("assets/images/midos.png")), 4.5),
    StoreCard("Pizza Hut", [Category("Pizza")],
        Image(image: AssetImage("assets/images/midos.png")), 4.3),
    StoreCard("Sandwich w Nos", [Category("Fast Food")],
        Image(image: AssetImage("assets/images/midos.png")), 4.4),
    StoreCard("Alturky", [Category("Shawarma")],
        Image(image: AssetImage("assets/images/midos.png")), 4.4),
  ];

  Widget build(BuildContext context) {
    return Container(
        child: new ListView.builder(
      itemCount: storesList.length,
      itemBuilder: (BuildContext context, int index) =>
          buildStoreCard(context, index),
    ));
  }

  Widget buildStoreCard(BuildContext context, int index) {
    final store = storesList[index];
    return new Container(
      child: InkWell(

        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              // border: Border.all(color:Colors.blue),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.,
              //       spreadRadius: 2.0,
              //       // blurRadius: 5.0),
              // ]
          ),
          margin: EdgeInsets.only(bottom:10.0, right: 15, left:20, top:10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(children: <Widget>[
                  Text(store.name, style: new TextStyle(fontSize: 20)),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 60.0),
                child: Row(children: <Widget>[
                  Text(store.category.toString()),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Text(store.rate.toString()),
                  SizedBox(width: 3),
                  Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                  // Spacer(),
                ]),
              ),
              // Image.asset(image: store.getImage()),
            ],
          ),
        ),
      ),
        onTap:(){
          Navigator.of(context).pushNamed(STORE_DETAILS);
        }
      ),
    );
  }
}
