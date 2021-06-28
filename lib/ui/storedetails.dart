// import 'package:flutter/material.dart';
// import 'package:mystery_meal/constants/constants.dart';
// import 'package:mystery_meal/models/store.dart';
// import 'package:mystery_meal/ui/widgets/details_appbar.dart';
// import 'package:mystery_meal/ui/widgets/details_body.dart';
//
// class DetailsScreen extends StatelessWidget {
//   final Store store;
//
//   DetailsScreen({Key key, @required this.store}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       appBar: detailsAppBar(),
//       body: Body(),
//     );
//   }
// }
//
// class DetailsScreen2 extends StatefulWidget {
//   final Store store;
//
//   DetailsScreen2({Key key, @required this.store}) : super(key: key);
//
//   @override
//   _DetailsScreen2 createState() => _DetailsScreen2();
// }
//
// class _DetailsScreen2 extends State<DetailsScreen2> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.store.s_name}"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             buildSelectedDetails(context, widget.store),
//
//             Spacer(),
//             Text("Location ${widget.store.s_name}"),
//             // RaisedButton(
//             //   child: Text("Select Dates"),
//             //   onPressed: () async {
//             //     await displayDateRangePicker(context);
//             //   },
//             // ),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //   children: <Widget>[
//             //     Text(
//             //         "Start Date: ${DateFormat('MM/dd/yyyy').format(_startDate).toString()}"),
//             //     Text(
//             //         "End Date: ${DateFormat('MM/dd/yyyy').format(_endDate).toString()}"),
//             //   ],
//             // ),
//             // RaisedButton(
//             //   child: Text("Continue"),
//             //   onPressed: () {
//             //     widget.store.startDate = _startDate;
//             //     widget.store.endDate = _endDate;
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //           builder: (context) =>
//             //               NewTripBudgetView(store: widget.store)),
//             //     );
//             //   },
//             // ),
//             Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildSelectedDetails(BuildContext context, Store store) {
//     // store=widget.store;
//     return Hero(
//       tag: "SelectedStore-${store.s_name}",
//       transitionOnUserGestures: true,
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 8.0,
//             right: 8.0,
//           ),
//           child: SingleChildScrollView(
//             child: Card(
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           top: 16.0, left: 16.0, bottom: 16.0),
//                       child: Column(
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Text(store.s_name, style: TextStyle(fontSize: 30.0)),
//                             ],
//                           ),
//                           Row(
//                             children: <Widget>[
//                               Text("Average Budget -- Not set up yet®"),
//                             ],
//                           ),
//                           Row(
//                             children: <Widget>[
//                               Text("Trip Dates"),
//                             ],
//                           ),
//                           Row(
//                             children: <Widget>[
//                               Text("Trip Budget"),
//                             ],
//                           ),
//                           Row(
//                             children: <Widget>[
//                               Text("Trip Type"),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: <Widget>[
//                       Placeholder(
//                         fallbackHeight: 100,
//                         fallbackWidth: 100,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // class DetailStoreView extends StatelessWidget {
// //   final Store store;
//
// //   DetailStoreView({Key key, @required this.store}): super(key:key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: CustomScrollView(
// //           slivers: <Widget>[
// //             SliverAppBar(
// //               title: Text('Store Details'),
// //               expandedHeight: 35,
// //               flexibleSpace: FlexibleSpaceBar(
// //                 // background: getImage,
// //               ),
// //             )
// //           ],
// //         )
// //       )
// //     );
// //   }
// // }
