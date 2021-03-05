import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardCard extends StatefulWidget {
  final String categoryName;
  final Color color;
  final IconData icon;
  final String newPageNav;
  DashboardCard(Key key,
      {this.categoryName, this.color, this.icon, this.newPageNav})
      : super(key: key);

  @override
  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    var color = 0xff453658;

    // return MaterialButton(
    //   shape: CircleBorder(),
    //   elevation: 5.0,
    //   color: widget.color,
    //   splashColor: widget.color.withAlpha(250),
    //   onPressed: () {},
    //   child: Icon(widget.icon, color: Colors.white),
    // );
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Wrap(
          // spacing: 32.0,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.7),
                // borderRadius: BorderRadius.circular(15.0),
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: widget.color.withOpacity(0.2), offset: Offset(2.0,6.0), blurRadius: 3.0,)
                ],
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    widget.color.withAlpha(255),
                    widget.color.withAlpha(220),
                    widget.color.withAlpha(180),
                  ],
                ),
                border: Border.all(color: widget.color, width: 5.0),
              ),
              child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, widget.newPageNav);
                },
                child: Icon(
                  widget.icon,
                  color: widget.color,
                  size: 26.0,
                ),
              ),
            ),
            Text(widget.categoryName.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0)
              ),
          ],
        ),
      ),
    );
  }
}

// class _DashboardCardState extends State<DashboardCard> {
//   @override
//   Widget build(BuildContext context) {
//     var color = 0xff453658;

//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, widget.newPageNav);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//             color: widget.color, borderRadius: BorderRadius.circular(10)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Icon(Icons.add, color: Colors.white, size: 42),
//             SizedBox(
//               height: 14,
//             ),
//             Text(
//               widget.categoryName,
//               style: GoogleFonts.openSans(
//                   textStyle: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600)),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               widget.categoryName,
//               style: GoogleFonts.openSans(
//                   textStyle: TextStyle(
//                       color: Colors.white38,
//                       fontSize: 10,
//                       fontWeight: FontWeight.w600)),
//             ),
//             SizedBox(
//               height: 14,
//             ),
//             Text(
//               widget.categoryName,
//               style: GoogleFonts.openSans(
//                   textStyle: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 11,
//                       fontWeight: FontWeight.w600)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _DashboardCardState extends State<DashboardCard> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, widget.newPageNav);
//       },
//       child: Column(
//         children: [
//           Card(
//             clipBehavior: Clip.antiAlias,
//             shape: RoundedRectangleBorder(
//                 side: BorderSide(width: 2.0),
//                 borderRadius: BorderRadius.circular(10.0)),
//             child: Padding(
//               padding: EdgeInsets.all(20),
//               child: Icon(Icons.add, color: widget.color),
//             ),
//           ),
//           Expanded(
//             child: new Center(
//               child: new Text(
//                 widget.categoryName,
//                 style: new TextStyle(
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               )
//             )
//           )
//         ],
//       ),
//     );
//   }
// }
