// import 'package:DealerPortalApp/Component/ColorCode.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           ClipPath(
//             clipper: LoginClipper2(),
//             child: Container(
//               width: double.infinity,
//               height: mediaQuery.size.height * .6,
//               decoration: BoxDecoration(
//                 color: ColorCode.AppColorCode.withOpacity(.8),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class LoginClipper1 extends CustomClipper<Path> {
// //   @override
// //   Path getClip(Size size) {
// //     var path = Path();
// //     path.lineTo(0.0, size.height - 20);

// //     var firstControlPoint = Offset(size.width / 4, size.height);
// //     var firstPoint = Offset(size.width / 2.25, size.height - 30);
// //     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
// //         firstPoint.dx, firstPoint.dy);

// //     var secondControlPoint =
// //         Offset(size.width - (size.width / 3.25), size.height - 65);
// //     var secondEndPoint = Offset(size.width, size.height - 40);
// //     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
// //         secondEndPoint.dx, secondEndPoint.dy);

// //     path.lineTo(size.width, size.height - 40);
// //     path.lineTo(size.width, 0.0);
// //     path.close();

// //     return path;
// //   }
// // }

// // class LoginClipper2 extends CustomClipper<Path> {
// //   @override
// //   Path getClip(Size size) {
//   //   var path = Path();
//   //   path.lineTo(0.0, size.height - 40);

//   //   var firstControlPoint = Offset(size.width / 4, size.height - 80);
//   //   var firstPoint = Offset(size.width / 3, size.height - 30);
//   //   path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//   //       firstPoint.dx, firstPoint.dy);

//   //   var secondControlPoint = Offset(size.width - (size.width / 3.25), size.height);
//   //   var secondEndPoint = Offset(size.width, size.height - 40);
//   //   path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//   //       secondEndPoint.dx, secondEndPoint.dy);

//   //   path.lineTo(size.width, size.height - 20);
//   //   path.lineTo(size.width, 0.0);
//   //   path.close();

//   //   return path;
//   // }

// //   @override
// //   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// // }
