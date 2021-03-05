// import 'package:flutter/material.dart';
// import 'package:sticky_grouped_list/sticky_grouped_list.dart';

// class StickyGroupedListViewHelper<T> extends StatelessWidget {
//   const StickyGroupedListViewHelper(
//       {Key key,
//       // this.element,
//       @required this.elements,
//       @required this.groupBy,
//       @required this.day,
//       @required this.month,
//       @required this.year,
//       @required this.icon,
//       @required this.name,
//       @required this.trailing,
//       @required this.groupComparator,
//       @required this.itemComparator})
//       : super(key: key);
  
//   // final T element;
//   final List<T> elements;
//   final int Function(DateTime, DateTime) groupComparator;
//   final int Function(T, T) itemComparator;
//   final DateTime Function(T) groupBy;
//   final int day;
//   final int month;
//   final int year;
//   final Widget trailing;
//   final IconData icon;
//   final String name;

//   @override
//   Widget build(BuildContext context) {
//   // final DateTime Function(T) groupBy = (T element) => DateTime(day, month, day);
//     return StickyGroupedListView<T, DateTime>(
//       elements: elements,
//       groupBy: groupBy,
//       groupComparator: groupComparator,
//       itemComparator: itemComparator,
//       floatingHeader: true,
//       groupSeparatorBuilder: (T element) => Container(
//         height: 50,
//         child: Align(
//           alignment: Alignment.center,
//           child: Container(
//             width: 120,
//             decoration: BoxDecoration(
//               color: Colors.blue[300],
//               border: Border.all(
//                 color: Colors.blue[300],
//               ),
//               borderRadius: BorderRadius.all(Radius.circular(20.0)),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 '${element.day}. $month, $year',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//       ),
//       itemBuilder: (_, T element) {
//         return Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6.0),
//           ),
//           elevation: 8.0,
//           margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//           child: Container(
//             child: ListTile(
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//               leading: Icon(icon),
//               title: Text(name),
//               // trailing: Text('${hour}:00'),
//               trailing: trailing,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
