// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:input_sheet/components/IpsCard.dart';
// import 'package:input_sheet/components/IpsError.dart';
// import 'package:input_sheet/components/IpsIcon.dart';
// import 'package:input_sheet/components/IpsLabel.dart';
// import 'package:input_sheet/components/IpsPhoto.dart';
// import 'package:input_sheet/components/IpsVideo.dart';
// import 'package:input_sheet/components/IpsValue.dart';

// import 'package:input_sheet/input_sheet.dart';
// import 'package:input_sheet/utils/colors.dart';

// class CompanyEditView2 extends StatefulWidget {
//   CompanyEditView2({Key key}) : super(key: key);

//   @override
//   _CompanyEditView2State createState() => _CompanyEditView2State();
// }

// class _CompanyEditView2State extends State<CompanyEditView2> {
//   String _name;
//   String _about;
//   String _phone;
//   double _currency;
//   String _flavor;
//   List<String> _selectedCategories;
//   String _birth;
//   String _dinner;
//   String _appointment;
//   File _photo;
//   File _video;
//   Uint8List _thumbnailVideo;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("widget.title"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 'Text example:',
//               ),
//               SizedBox(height: 15),
//               IpsCard(
//                 label: IpsLabel("Name"),
//                 value: IpsValue(_name ?? "Touch to edit..."),
//                 icon: IpsIcon(Icons.person),
//                 error: IpsError('error'),
//                 onClick: () => InputSheet(
//                   context,
//                   label: "Name",
//                   cancelText: "Cancel",
//                   doneText: "Confirm",
//                 ).text(
//                   placeholder: "Type here...",
//                   value: _name,
//                   onDone: (dynamic value) => setState(
//                     () {
//                       _name = value;
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
