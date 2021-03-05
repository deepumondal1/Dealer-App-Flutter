import 'package:DealerPortalApp/View/CompanyMaster/CompanyMaster.dart';
import 'package:DealerPortalApp/View/CustomerOrder/CustomerOrderMaster.dart';
import 'package:DealerPortalApp/View/HomeScreen/HomeScreen.dart';
import 'package:DealerPortalApp/View/ReportView/ReportView.dart';
import 'package:DealerPortalApp/View/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';

final routes = {
  "/HomeScreen" : (context) => HomeScreen(),
  // "/LoginScreen" : (context) => LoginScreen(),
  "/CompanyMaster" : (context) => CompanyMaster(title: "COMPANY LIST", color: Colors.purple[900]),
  "/CustomerOrder" : (context) => CustomerOrderMaster(title: "CUSTOMER ORDER LIST", color: Colors.purple[900]),
  "/ReportView" : (context) => ReportView(title: "ORDER REPORTS", color: Colors.purple[900]),
};