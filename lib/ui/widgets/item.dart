import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Item {
  final String id;
  final String title, picture, category, price, store_id;

  Item({
    this.id,
    this.title,
    this.picture,
    this.category,
    this.price,
    this.store_id,
  });

  factory Item.fromJson(Map<String, dynamic> jsonData) {
    return Item(
      id: jsonData['id'],
      title: jsonData['title'],
      picture: jsonData['picture'],
      category: jsonData['category'],
      price: jsonData['price'],
      store_id: jsonData['store_id'],
    );
  }
}

Future<List<Item>> itemsDownloadJSON(String storeId) async {
  Map data = {
    'store_id': storeId,
  };
  var url = "https://mystery-meal.000webhostapp.com/items_list.php";
  final response = await http.post(
    url,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: data,
    encoding: Encoding.getByName("utf-8"),
  );
  var body = await json.decode(json.encode(response.body));

  if (response.statusCode == 200) {
    print(body.runtimeType);
    print(body);
  } else {
    print("error");
  }

  if (response.statusCode == 200) {
    List items = json.decode(response.body);
    return items.map((item) => new Item.fromJson(item)).toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}

class ItemsScreen extends StatelessWidget {
  final String storeId;

  ItemsScreen({this.storeId});

  Widget build(context) {
    return Scaffold(
      appBar: new AppBar(),
      body: Center(
        child: new FutureBuilder<List<Item>>(
          future: itemsDownloadJSON(storeId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Item> items = snapshot.data;
              return new ItemsListView(items);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return new CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class ItemsListView extends StatelessWidget {
  final List<Item> items;

  ItemsListView(this.items);

  Widget build(context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, int currentIndex) {
        return createItem(items[currentIndex], context);
      },
    );
  }

  Widget createItem(Item item, BuildContext context) {
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
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item.picture,
                  height: 110,
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  children: <Widget>[
                    Padding(
                        child: Text(
                          item.title + " | ",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        padding: EdgeInsets.all(5.0)),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right:10.0),
                      child: Text(
                        item.price +"\$",
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      child: Text(
                        item.category,
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
