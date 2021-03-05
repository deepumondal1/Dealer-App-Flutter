import 'package:DealerPortalApp/Component/ColorCode.dart';
import 'package:flutter/material.dart';

import './dashboardModal.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList;
    final List<DashboardModal> _dashboardModal =
        DashboardModal().getDashboardList();

    // _widgetList.add(
    //   UserAccountsDrawerHeader(
    //     decoration: BoxDecoration(color: ColorCode.AppColorCode),
    //     accountName: Text('UserName'),
    //     accountEmail: Text('username@email.com'),
    //     currentAccountPicture: CircleAvatar(
    //       child: Icon(Icons.person_outline),
    //     ),
    //   ),
    // );

    // for (DashboardModal i in _dashboardModal) {
    //   _widgetList.add(
    //     Padding(
    //       padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
    //       child: ListTile(
    //         leading: Icon(i.icon, color: i.color),
    //         title: Text(i.categoryName),
    //         onTap: () {
    //           Navigator.pop(context);
    //           Navigator.pushNamed(context, i.newPageNav);
    //         },
    //       ),
    //     ),
    //   );
    // }
    return new Drawer(
      child: new ListView(
        children: _dashboardModal.map(
          (i) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
              child: ListTile(
                leading: Icon(i.icon, color: i.color),
                title: Text(i.categoryName),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, i.newPageNav);
                },
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
