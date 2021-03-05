import 'package:flutter/material.dart';
import './header.dart';
import './menuCard.dart';
import './homeDrawer.dart';
// import 'package:googlfonts/googlefonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = .55;
  bool _isDone = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _viewOnline() {
    setState(() {
      _isDone = !_isDone;
    });
    _isDone
        ? setState(() {
            _height = 0.55;
          })
        : setState(() {
            _height = 0.08;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white.withOpacity(0.5),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.short_text),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        centerTitle: true,
        title: const Text(
          "COMPANY NAME",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
//--------------------------------------------------------------------------------------------------------------//
      drawer: HomeDrawer(),
//--------------------------------------------------------------------------------------------------------------//
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Header(_viewOnline),
            ],
          ),
          MenuCard(_height),
          // Positioned(
          //   bottom: 0,
          //   left: 18.0,
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * _height,
          //     width: MediaQuery.of(context).size.width * 0.94,
          //     color: Colors.green,
          //   ),
          // ),
        ],
      ),
    );
  }
}
