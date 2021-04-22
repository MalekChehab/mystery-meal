import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/models/category.dart';
import 'package:mystery_meal/models/store.dart';
import 'package:mystery_meal/models/storeCard.dart';

// import '../storedetails.dart';

Widget image() {
  return Image(image: AssetImage("images/midos.png"));
}

class HomeView extends StatelessWidget {
  Store store;
  final List<StoreCard> storesList2 = [
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
    return new Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 8.0,
        right: 8.0,
      ),
      child: Card(
        child: InkWell(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Placeholder(
                    fallbackHeight: 70,
                    fallbackWidth: 70,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(storesList[index].name,
                              style: TextStyle(fontSize: 20.0)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 5.0),
                            child: Row(children: <Widget>[
                              Text(storesList[index].category.toString()),
                              // Spacer(),
                            ]),
                          ),
                          Spacer(),
                          Row(children: <Widget>[
                              Text(storesList[index].rate.toString()),
                              // SizedBox(width: 3),
                              Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            print(store.name);
            Navigator.of(context).pushNamed(STORE_DETAILS);
          },
        ),
      ),
    );
  }
}

