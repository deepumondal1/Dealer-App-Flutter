import 'package:flutter/material.dart';

class DashboardModal {
  final int id;
  final String categoryName;
  final Color color;
  final IconData icon;
  final String newPageNav;

  DashboardModal(
      {this.id,
      this.icon,
      this.categoryName,
      this.color,
      this.newPageNav});

  List<DashboardModal> getDashboardList() {
    return [
      DashboardModal(
        id: 1,
        icon: Icons.data_usage,
        categoryName: "OverView ",
        color: Colors.blue,
        newPageNav: ""
      ),
      // DashboardModal(
      //   id: 2,
      //   icon: Icons.add_business_outlined,
      //   categoryName: "Company Master",
      //   color: Colors.orange,
      //   newPageNav: "/CompanyMaster"
      // ),
      DashboardModal(
        id: 2,
        icon: Icons.add_business_outlined,
        categoryName: "Customer Order List",
        color: Colors.orange,
        newPageNav: "/CustomerOrder"
      ),
      DashboardModal(
        id: 3,
        icon: Icons.add_alert_outlined,
        categoryName: "View Report",
        color: Colors.green,
        newPageNav: "/ReportView"
      ),
    ];
  }
}
