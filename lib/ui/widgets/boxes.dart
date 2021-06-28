import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/Provider/user_secure_storage.dart';
import 'package:mystery_meal/ui/home/orders.dart';
import 'package:mystery_meal/ui/widgets/item.dart';
import 'package:toast/toast.dart';

class Box {
  final String id;
  final category, storeId, nbOfItems, storeName;
  final String totalPrice;

  Box(
      {this.id,
      this.category,
      this.nbOfItems,
      this.totalPrice,
      this.storeId,
      this.storeName});

  factory Box.fromJson(Map<String, dynamic> jsonData) {
    return Box(
      id: jsonData['id'],
      category: jsonData['category'],
      nbOfItems: jsonData['nb_of_items'],
      totalPrice: jsonData['total_price'],
      storeId: jsonData['store_id'],
      storeName: jsonData['s_name'],
    );
  }
}

Future<List<Box>> boxDownloadJSON(String storeId) async {
  Map data = {
    'store_id': storeId,
  };
  var url = "https://mystery-meal.000webhostapp.com/boxes_list.php";
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
    List boxes = json.decode(response.body);
    return boxes.map((box) => new Box.fromJson(box)).toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}

class BoxesScreen extends StatelessWidget {
  final String storeId;

  BoxesScreen({this.storeId});

  Widget build(context) {
    return Scaffold(
      appBar: new AppBar(),
      body: Center(
        child: new FutureBuilder<List<Box>>(
          future: boxDownloadJSON(storeId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Box> boxes = snapshot.data;
              return new BoxesListView(boxes);
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

class BoxesListView extends StatelessWidget {
  final List<Box> boxes;

  BoxesListView(this.boxes);

  Widget build(context) {
    return ListView.builder(
      itemCount: boxes.length,
      itemBuilder: (context, int currentIndex) {
        return createBox(boxes[currentIndex], context);
      },
    );
  }

  Widget createBox(Box box, BuildContext context) {
    return new ListTile(
      title: new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10.0,
        child: new Container(
          height: 130,
          decoration: BoxDecoration(
              // border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(10.0),
          // margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Box# " + box.id,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    child: Text(
                      box.category,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.all(5.0),
                  ),
                  Expanded(
                    child: Padding(
                      child: Text(
                        box.totalPrice + "\$",
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  child: Text(
                    box.nbOfItems + " items",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  child: Text(
                    "From " + box.storeName,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
              ),
            ],
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
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Box# " + box.id,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          child: Text(
                            "This box consists of " + box.category,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          padding: EdgeInsets.all(8),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Padding(
                        child: Text(
                          "From " + box.storeName,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.only(
                            left: 8, top: 8, bottom: 8, right: 8),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          child: Text(
                            "This box has " + box.nbOfItems + " items",
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          padding: EdgeInsets.all(8),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "The total price would be " + box.totalPrice + "\$",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: RaisedButton(
                    child: Text("Order box"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    textColor: Theme.of(context).scaffoldBackgroundColor,
                    color: Theme.of(context).accentColor,
                    onPressed: () async {
                      String username = await UserSecureStorage.getUsername();
                      sendData(box.id, username, box.totalPrice, box.storeId,
                          context);
                    },
                  ),
                )
              ],
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
        );
      },
    );
  }

  sendData(String boxId, String costumerUsername, String totalPrice,
      String storeId, BuildContext context) async {
    Map data = {
      'box_id': boxId,
      'customer_username': costumerUsername,
      'total_price': totalPrice,
      'store_id': storeId,
    };
    var url = "https://mystery-meal.000webhostapp.com/create_orders.php";
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
    try {
      if (response.statusCode == 200) {
        print(boxId);
        print(body.runtimeType);
        print(body);
        if (body[9] == 't') {
          print("error");
        }
        if (body[9] != 't') {
          print("success");
          print("User Registered Successfully");
          Navigator.of(context).pushReplacementNamed(ORDERS);
        } else {
          print(" ${body[1]}");
        }
      } else {
        print(
          "Please Try again",
        );
      }
    } on SocketException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
}

// class BoxesScreen extends StatelessWidget {
//   final String storeId;
//
//   BoxesScreen({this.storeId});
//
//   Widget build(context) {
//     return Scaffold(
//       appBar: new AppBar(),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               new FutureBuilder<List<Box>>(
//                 future: boxDownloadJSON(storeId),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     List<Box> boxes = snapshot.data;
//                     return BoxesListView(boxes);
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }
//                   return new CircularProgressIndicator();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   // Future function(List<Box> boxes) async{
//   //   List<Box> selectedBoxes=[];
//   //   String username = await UserSecureStorage.getUsername();
//   //   int totalPrice=0;
//   //   String ids ='';
//   //   int counter =0;
//   //   int storeId = 0;
//   //   for(Box box in boxes){
//   //     if(box.isCheck==true){
//   //       selectedBoxes.add(box);
//   //     }
//   //   }
//   //   for(Box box in selectedBoxes){
//   //     ids=box.id+",";
//   //     totalPrice += int.parse(box.totalPrice);
//   //     counter++;
//   //     storeId = int.parse(box.storeId);
//   //     print(box.isCheck);
//   //   }
//   //   sendData(ids, username, totalPrice.toString(), counter.toString(), storeId.toString());
//   // }
//
//   // sendData(String boxesIds, String costumerUsername,String totalPrice, String nbOfBoxes, String storeId) async{
//   //   Map data = {
//   //     'boxes_id': boxesIds,
//   //     'customer_username': costumerUsername,
//   //     'total_price': totalPrice,
//   //     'nb_of_boxes': nbOfBoxes,
//   //     'store_id': storeId,
//   //   };
//   //   var url = "https://mystery-meal.000webhostapp.com/create_orders.php";
//   //   final response = await http.post(
//   //     url,
//   //     headers: {
//   //       "Accept": "application/json",
//   //       "Content-Type": "application/x-www-form-urlencoded"
//   //     },
//   //     body: data,
//   //     encoding: Encoding.getByName("utf-8"),
//   //   );
//   //   var body = await json.decode(json.encode(response.body));
//   //   try {
//   //     if (response.statusCode == 200) {
//   //       print(totalPrice);
//   //       print(nbOfBoxes);
//   //       print(storeId);
//   //       print(body.runtimeType);
//   //       print(body);
//   //       if (body[9] == 't') {
//   //       //   Toast.show(body.toString().substring(25, 48), context,
//   //       //       duration: Toast.LENGTH_LONG,
//   //       //       gravity: _keyboardIsVisible() ? Toast.CENTER : Toast.BOTTOM);
//   //         print("error");
//   //       }
//   //       if (body[9] != 't') {
//   //         print("success");
//   //         print("User Registered Successfully");
//   //           // Navigator.of(context).pushNamed(ORDERS);
//   //       } else {
//   //         print(" ${body[1]}");
//   //       }
//   //     } else {
//   //       print("Please Try again",);
//   //     }
//   //   } on SocketException catch (e) {
//   //     print(e);
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
// }
//
// class BoxesListView extends StatelessWidget {
//   final List<Box> boxes;
//
//   BoxesListView(this.boxes);
//
//   Widget build(context) {
//     return ListView.builder(
//       itemCount: boxes.length,
//       itemBuilder: (context, int currentIndex) {
//         return createBox(boxes[currentIndex], context);
//       },
//     );
//   }
//
//   Widget createBox(Box box, BuildContext context) {
//     return new ListTile(
//       title: new Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         elevation: 10.0,
//         child: new Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: Theme.of(context).primaryColor),
//               borderRadius: BorderRadius.circular(10)),
//           padding: EdgeInsets.all(10.0),
//           margin: EdgeInsets.all(10.0),
//           child: Column(
//             children: <Widget>[
//               SingleChildScrollView(
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: Padding(
//                           child: Text(
//                             box.category + " | ",
//                             style: new TextStyle(fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.left,
//                           ),
//                           padding: EdgeInsets.all(5.0)),
//                     ),
//                     // Text(" | "),
//                     Expanded(
//                       child: Padding(
//                         child: Text(
//                           box.storeId.toString(),
//                           style: new TextStyle(fontStyle: FontStyle.italic),
//                           textAlign: TextAlign.right,
//                         ),
//                         padding: EdgeInsets.all(1.0),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
