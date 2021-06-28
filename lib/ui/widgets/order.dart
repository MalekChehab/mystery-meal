import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mystery_meal/ui/widgets/item.dart';
import 'package:url_launcher/url_launcher.dart';

class Order {
  final String id;
  final String totalPrice, storeId, storeName, orderDate, boxId, username, status, category;

  Order({
    this.id,
    this.totalPrice,
    this.storeId,
    this.storeName,
    this.orderDate,
    this.boxId,
    this.category,
    this.username,
    this.status
  });

  factory Order.fromJson(Map<String, dynamic> jsonData) {
    return Order(
      id: jsonData['id'],
      totalPrice: jsonData['total_order_price'],
      storeId: jsonData['store_id'],
      storeName: jsonData['s_name'],
      orderDate: jsonData['created_at'],
      boxId: jsonData['box_id'],
      status: jsonData['status'],
      category: jsonData['category'],
    );
  }
}

class OrdersListView extends StatelessWidget {
  final List<Order> orders;

  OrdersListView(this.orders);

  Widget build(context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, int currentIndex) {
        return createOrderCard(orders[currentIndex], context);
      },
    );
  }

  Widget createOrderCard(Order order, BuildContext context) {
    return ListTile(
      title: new Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: new Container(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      Icons.date_range_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 33,
                    ),
                    Padding(
                      child: Text(
                        order.orderDate,
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
                      "Order# " + order.id,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.store_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 33,
                    ),
                    Padding(
                      child: Text(
                        "From " ,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.only(left:10.0, top:10.0, bottom: 10, right: 5),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        order.storeName,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Theme.of(context).accentColor,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.food_bank_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 33,
                    ),
                    Padding(
                      child: Text(
                        order.boxId + " Boxes",
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
                      Icons.attach_money_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 33,
                    ),
                    Padding(
                      child: Text(
                        "Total Price: ${order.totalPrice}",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(10.0),
                    ),
                    Spacer(),
                    ButtonTheme(
                      minWidth: 30.0,
                      height: 30.0,
                      child: RaisedButton(
                        onPressed: (){},
                        textColor: Theme.of(context).scaffoldBackgroundColor,
                        color: Theme.of(context).accentColor,
                        child: Text(order.status),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.date_range_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 33,
                      ),
                      Padding(
                        child: Text(
                          order.orderDate,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      Spacer(),
                      Text(
                        "Order# ${order.id}",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.store_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 33,
                      ),
                      Padding(
                        child: Text(
                          "From ",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.only(left:8, top:8, bottom: 8, right: 4),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          order.storeName,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.food_bank_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 33,
                      ),
                      Padding(
                        child: Text(
                          "${order.boxId} Boxes",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.attach_money_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 33,
                      ),
                      Padding(
                        child: Text(
                          "Total Price: ${order.totalPrice}",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.all(10.0),
                      ),
                      Spacer(),
                      ButtonTheme(
                        minWidth: 30.0,
                        height: 30.0,
                        child: RaisedButton(
                          onPressed: (){},
                          textColor: Theme.of(context).scaffoldBackgroundColor,
                          color: Theme.of(context).accentColor,
                          child: Text(order.status),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
        );
      },
    );
  }
}

Future<List<Order>> ordersDownloadJSON(String username) async {
  Map data = {
    'username': username,
  };
  var url = "https://mystery-meal.000webhostapp.com/orders_list.php";
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
    List orders = json.decode(response.body);
    return orders.map((order) => new Order.fromJson(order)).toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}

// class SecondScreen extends StatefulWidget {
//   final Store store;
//   final List<Item> items;
//
//   SecondScreen({Key key, this.store, this.items}) : super(key: key);
//
//   @override
//   _SecondScreenState createState() => _SecondScreenState();
// }
//
// class _SecondScreenState extends State<SecondScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Container(
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               title: new Text(widget.store.s_name),
//               backgroundColor: Theme.of(context).primaryColor,
//               expandedHeight: 250,
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Hero(
//                   tag: "SelectedStore-${widget.store.id}",
//                   transitionOnUserGestures: true,
//                   child: Image.network(
//                     widget.store.s_picture,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SliverFixedExtentList(
//               delegate: SliverChildListDelegate([
//                 createStoreDetails(widget.store, context),
//                 ItemsListView(widget.items),
//                 // createItemsList(),
//               ]),
//               itemExtent: 200,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget createItemsList() {
//   //   return Center(
//   //     child: FutureBuilder<List<Item>>(
//   //       future: itemsDownloadJSON(),
//   //       builder: (context, snapshot) {
//   //         try {
//   //           if (snapshot.hasData) {
//   //             // return ListView.builder(
//   //             //   itemCount: snapshot.data.length,
//   //             //   itemBuilder: (BuildContext context, index) {
//   //             //     Item item = snapshot.data[index];
//   //             //     return Text('${item.store_id}');
//   //             //   },
//   //             // );
//   //             List<Item> items = snapshot.data;
//   //             return ItemsListView(items);
//   //           } else if (snapshot.hasError) {
//   //             return Text('${snapshot.error}');
//   //           }
//   //           return new CircularProgressIndicator();
//   //         } on SocketException catch (e) {
//   //           return Text("please connect to the internet");
//   //         }
//   //       },
//   //     ),
//   //   );
//   // }
//
//   Widget createStoreDetails(Store store, BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: new Container(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: <Widget>[
//               Row(children: <Widget>[
//                 Icon(
//                   Icons.food_bank_rounded,
//                   color: Theme.of(context).primaryColor,
//                   size: 33,
//                 ),
//                 Padding(
//                     child: Text(
//                       store.s_category,
//                       style: new TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17,
//                       ),
//                       textAlign: TextAlign.right,
//                     ),
//                     padding: EdgeInsets.all(10.0)),
//                 Spacer(),
//                 Text(
//                   "rating",
//                   style: new TextStyle(
//                     fontSize: 17,
//                   ),
//                 ),
//                 Icon(
//                   Icons.star,
//                   color: Colors.blue,
//                   size: 33,
//                 ),
//               ]),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.location_on_rounded,
//                     color: Theme.of(context).primaryColor,
//                     size: 33,
//                   ),
//                   Padding(
//                       child: Text(
//                         store.s_address,
//                         style: new TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17,
//                         ),
//                         textAlign: TextAlign.right,
//                       ),
//                       padding: EdgeInsets.all(10.0)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.phone_rounded,
//                     color: Theme.of(context).primaryColor,
//                     size: 33,
//                   ),
//                   GestureDetector(
//                     onTap: () => launch('tel:${widget.store.s_phone}'),
//                     child: Padding(
//                         child: Text(
//                           store.s_phone,
//                           style: new TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17,
//                             color: Theme.of(context).accentColor,
//                           ),
//                           textAlign: TextAlign.right,
//                         ),
//                         padding: EdgeInsets.all(10.0)),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.access_time_rounded,
//                     color: Theme.of(context).primaryColor,
//                     size: 33,
//                   ),
//                   // Text("Closes at:"),
//                   Padding(
//                       child: Text(
//                         "Closes at: ${store.s_close_time}",
//                         style: new TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17,
//                         ),
//                         textAlign: TextAlign.right,
//                       ),
//                       padding: EdgeInsets.all(10.0)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
