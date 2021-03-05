import 'package:DealerPortalApp/Component/ColorCode.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboardCard.dart';
import 'dashboardModal.dart';

class MenuCard extends StatefulWidget {
  final double height;

  const MenuCard(this.height);
  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  final List<DashboardModal> _dashboardModal =
      DashboardModal().getDashboardList();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Positioned(
      bottom: 0,
      left: mediaQuery.size.width * 0.03,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: mediaQuery.size.width * 0.94,
        height: mediaQuery.size.height * widget.height,
        decoration: BoxDecoration(
          color: ColorCode.WhiteTextColorCode,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(
              12,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Your Menu",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorCode.AppColorCode,
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                // shrinkWrap: true,
                padding: EdgeInsets.all(5.0),
                controller: ScrollController(initialScrollOffset: -14.0),
                children: _dashboardModal.map<Widget>((e) {
                  // return Container(width: 10, height: 10,color: Colors.green);
                    return DashboardCard(Key(e.id.toString()),
                        categoryName: e.categoryName,
                        color: e.color,
                        icon: e.icon,
                        newPageNav: e.newPageNav);
                }).toList(),
                // children: [
                //   Container(width: 10, height: 10,color: Colors.green),
                //   Container(width: 10, height: 10,color: Colors.green),
                //   Container(width: 10, height: 10,color: Colors.green),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
