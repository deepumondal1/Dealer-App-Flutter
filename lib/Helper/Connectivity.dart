
// import 'package:DealerPortalApp/Component/ColorCode.dart';
// import 'package:DealerPortalApp/Component/GlobalStringText.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';

// class ConnectivityConn{
  
//   //----------------------------------------------------------------------------------------------------------//
//   void checkInternetConnectivity(BuildContext context) async {
//     var result = await Connectivity().checkConnectivity();
//     if (result == ConnectivityResult.none) {
//       _InterNetshowDialog(
//         context,
//         GlobalStringText.Nointernet,
//         GlobalStringText.notconnectednetwork
//         );
//     }
//   }
// //--------------------------------------------------------------------------------------------------------//
//   Future<void> _InterNetshowDialog(context, title, text) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(GlobalStringText.InternetWarning, textAlign: TextAlign.center,
//                         style: new TextStyle(fontSize: 15.0,
//                                                  color: ColorCode.AppColorCode,
//                                                  fontWeight: FontWeight.bold),),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text(title.toString(),
//                        textAlign: TextAlign.center,
//                        style: new TextStyle(fontSize: 12.0,
//                                                 color: ColorCode.AppColorCode,
//                                                 fontWeight: FontWeight.bold),),
//               ],
//               ),
//             ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 //("hello123"+id.toString());
//                 Navigator.of(context).pop();
//               },
//               child: Text(GlobalStringText.ok, style: new TextStyle(fontSize: 15.0,
//                                                                         color: ColorCode.AppColorCode,
//                                                                         fontWeight: FontWeight
//                                                                             .bold),),
//               ),
//           ],
//           );
//       },
//       );
//   }
// }