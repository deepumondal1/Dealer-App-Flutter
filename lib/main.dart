import 'package:DealerPortalApp/Component/ColorCode.dart';
import 'package:DealerPortalApp/Provider/CompanyNameProvider.dart';
import 'package:DealerPortalApp/routes.dart';
import 'package:DealerPortalApp/onGenerateRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Provider/CustomerOrderProvider.dart';

void main() => runApp(new MyApp());
Map<int, Color> color = {
  50: Color.fromRGBO(42, 54, 59, .1),
  100: Color.fromRGBO(42, 54, 59, .2),
  200: Color.fromRGBO(42, 54, 59, .3),
  300: Color.fromRGBO(42, 54, 59, .4),
  400: Color.fromRGBO(42, 54, 59, .5),
  500: Color.fromRGBO(42, 54, 59, .6),
  600: Color.fromRGBO(42, 54, 59, .7),
  700: Color.fromRGBO(42, 54, 59, .8),
  800: Color.fromRGBO(42, 54, 59, .9),
  900: Color.fromRGBO(42, 54, 59, 1),
};

//--------------------------------------------------------------------------------------------------------------//
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  void initState() {}
//--------------------------------------------------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ColorCode.AppColorCode),
    );
    MaterialColor colorCustom = MaterialColor(0xFF2A363A, color);
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<CompanyNameProvider>(
        //   builder: (_) => CompanyNameProvider(),
        // ),
        ChangeNotifierProvider<CustomerOrderProvider>(
          create: (_) => CustomerOrderProvider(),
        ),
      ],
      child: new MaterialApp(
        theme: new ThemeData(
          primarySwatch: colorCustom,
          scaffoldBackgroundColor: const Color(0xFFEFEFEF),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/HomeScreen',
        routes: routes,
        // onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
//--------------------------------------------------------------------------------------------------------------//
