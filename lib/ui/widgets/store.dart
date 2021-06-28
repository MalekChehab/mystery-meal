import 'dart:convert';
import 'dart:io';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mystery_meal/ui/widgets/boxes.dart';
import 'package:mystery_meal/ui/widgets/item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Store {
  final String id;
  final String s_name, s_picture, s_category, s_address, s_phone, s_close_time;

  Store({
    this.id,
    this.s_name,
    this.s_picture,
    this.s_category,
    this.s_address,
    this.s_phone,
    this.s_close_time,
  });

  factory Store.fromJson(Map<String, dynamic> jsonData) {
    //for example
    return Store(
      id: jsonData['id'],
      s_name: jsonData['s_name'],
      s_picture: jsonData['s_picture'],
      s_category: jsonData['s_category'],
      s_address: jsonData['s_address'],
      s_phone: jsonData['s_phone'],
      s_close_time: jsonData['s_close_time'],
    );
  }
}

class StoresListView extends StatelessWidget {
  final List<Store> stores;

  StoresListView(this.stores);

  Widget build(context) {
    return ListView.builder(
      itemCount: stores.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(stores[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Store store, BuildContext context) {
    return new ListTile(
      title: new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10.0,
        child: new Container(
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          child: Column(children: <Widget>[
            Hero(
              tag: "SelectedStore-${store.id}",
              transitionOnUserGestures: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  store.s_picture,
                  height: 110,
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Row(children: <Widget>[
                Expanded(
                  child: Padding(
                      child: Text(
                        store.s_name + " | ",
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      padding: EdgeInsets.all(5.0)),
                ),
                // Text(" | "),
                Expanded(
                  child: Padding(
                    child: Text(
                      store.s_category,
                      style: new TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.all(1.0),
                  ),
                ),
              ]),
            ),
          ]),
        ),
        // ],
      ),
      // ),
      // ),
      onTap: () {
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new StoreDetails(store: store),
        );
        Navigator.of(context).push(route);
      },
    );
  }
}

Future<List<Store>> storesDownloadJSON() async {
  final jsonEndpoint = "https://mystery-meal.000webhostapp.com/stores_list.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List stores = json.decode(response.body);
    return stores.map((store) => new Store.fromJson(store)).toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}

class StoreDetails extends StatefulWidget {
  final Store store;

  StoreDetails({Key key, this.store}) : super(key: key);

  @override
  _StoreDetailsState createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return new Scaffold(
      body: new Container(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: new Text(widget.store.s_name),
              backgroundColor: Theme.of(context).primaryColor,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: "SelectedStore-${widget.store.id}",
                  transitionOnUserGestures: true,
                  child: Image.network(
                    widget.store.s_picture,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200.0, minHeight: 200.0),
                  child: createStoreDetails(widget.store, context),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 80.0, minHeight: 80.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: showItemsButton(widget.store.id),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 80.0, minHeight: 80.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: showBoxesButton(widget.store.id),
                  ),
                ),

              ]),
              // itemExtent: 200,
            ),
          ],
        ),
      ),
    );
  }

  Widget showItemsButton(String storeId) {
    return RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        textColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).accentColor,
        child: Text("show items"),
        onPressed: () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new ItemsScreen(
              storeId: widget.store.id,
            ),
          );
          Navigator.of(context).push(route);
        });
  }

  Widget showBoxesButton(String storeId) {
    return RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        textColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).accentColor,
        child: Text("show Boxes"),
        onPressed: () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new BoxesScreen(
              storeId: widget.store.id,
            ),
          );
          Navigator.of(context).push(route);
        });
  }

  Widget createStoreDetails(Store store, BuildContext context) {
    queryData = MediaQuery.of(context);
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: new Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Icon(
                  Icons.food_bank_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 33,
                ),
                Padding(
                  child: Text(
                    store.s_category,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Spacer(),
                Text(
                  "rating",
                  style: new TextStyle(
                    fontSize: 17,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.blue,
                  size: 33,
                ),
              ]),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 33,
                  ),
                  Padding(
                    child: Text(
                      store.s_address,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.all(10.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 33,
                  ),
                  GestureDetector(
                    onTap: () => launch('tel:${widget.store.s_phone}'),
                    child: Padding(
                        child: Text(
                          store.s_phone,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Theme.of(context).accentColor,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.all(10.0)),
                  ),
                ],
              ),
              Row(children: [
                Icon(
                  Icons.access_time_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 33,
                ),
                // Text("Closes at:"),
                Padding(
                  child: Text(
                    "Closes at: ${store.s_close_time}",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget createItemDetails(Item item, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10.0,
      child: Container(
        // decoration: BoxDecoration(
        //     border: Border.all(color: Theme.of(context).primaryColor),
        //     borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(3.0),
        margin: EdgeInsets.all(3.0),
        child: Wrap(
          children: [
            Row(
              children: [
                Image.network(
                  item.picture,
                  height: 100,
                  width: 100,
                  // fit: BoxFit.fitHeight,
                ),
                Text(item.title),
              ],
            )
          ],

          // children: <Widget>[
          //
          //   SingleChildScrollView(
          //     child: Row(children: <Widget>[
          //       Expanded(
          //         child: Padding(
          //             child: Text(
          //               item.title,
          //               style: new TextStyle(fontWeight: FontWeight.bold),
          //               textAlign: TextAlign.left,
          //             ),
          //             padding: EdgeInsets.all(5.0)),
          //       ),
          //       Text(" | "),
          //       Expanded(
          //         child: Padding(
          //             child: Text(
          //               item.category,
          //               style: new TextStyle(fontStyle: FontStyle.italic),
          //               textAlign: TextAlign.left,
          //             ),
          //             padding: EdgeInsets.all(1.0)),
          //       ),
          //       Spacer(),
          //       Row(children: <Widget>[
          //         Text("rating"),
          //         // SizedBox(width: 3),
          //         Icon(
          //           Icons.star,
          //           color: Colors.blue,
          //         ),
          //       ]),
          //     ]),
          //   ),
          // ],
        ),
      ),
    );

    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: new ListTile(
        title: new Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(children: [
                  Placeholder(
                    fallbackHeight: 100,
                    fallbackWidth: 100,
                  ),
                  Column(children: [
                    Text(
                      item.category,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Padding(
                      child: Text(
                        "${item.store_id}",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      padding: EdgeInsets.all(10.0),
                    ),
                  ]),
                  Padding(
                    child: Text(
                      "Total Price: ${item.price}",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.all(10.0),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
