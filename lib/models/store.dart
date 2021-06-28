// // import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:mystery_meal/models/category.dart';
//
// class Store {
//   // final String id, name;
//   // List<Category> category;
//   // Location location;
//   // DateTime openingTime;
//   // DateTime closingTime;
//   // int phoneNumber;
//   // String email;
//   // List<String> typeOfBoxes;
//   // Image image;
//
//   // Store({
//   //   @required this.name,
//   //   @required this.category,
//   //   // @required this.location,
//   //   @required this.openingTime,
//   //   @required this.closingTime,
//   //   @required this.phoneNumber,
//   //   @required this.email,
//   //   @required this.typeOfBoxes,
//   // });
//
//   final String id;
//   final String s_name, s_category, s_address , s_phone, s_close_time;
//
//   Store({
//     this.id,
//     this.s_name,
//     this.s_category,
//     this.s_address,
//     this.s_phone,
//     this.s_close_time,
//   });
//
//   factory Store.fromJson(Map<String, dynamic> jsonData) {
//     return Store(
//       id: jsonData['id'],
//       s_name: jsonData['s_name'],
//       s_category: jsonData['s_category'],
//       s_address: jsonData['s_address'],
//       s_phone: jsonData['s_phone'],
//       s_close_time: jsonData['s_close_time'],
//     );
//   }
// }
