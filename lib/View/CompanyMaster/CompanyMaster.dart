import 'package:DealerPortalApp/Helper/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:DealerPortalApp/Provider/CompanyNameProvider.dart';
import 'package:DealerPortalApp/Model/Core/CompanyName.dart';
import 'package:page_transition/page_transition.dart';

import 'CompanyEditView.dart';
import './companyMasterListTile.dart';

class CompanyMaster extends StatefulWidget {
  final String title;
  final Color color;
  CompanyMaster({key, this.title, this.color}) : super(key: key);
  @override
  _CompanyMasterState createState() => _CompanyMasterState();
}

class _CompanyMasterState extends State<CompanyMaster> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

/* ****************************************************************************************************************** */
  @override
  Widget build(BuildContext context) {
    final companyNameProvider =
        Provider.of<CompanyNameProvider>(context).getAllCompanyNameProvider();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
//--------------------------------------------------------------------------------------------------------------//
      appBar: AppBar(
        actionsIconTheme: IconThemeData(size: 28.0, opacity: 10.0),
        elevation: 0.0,
        bottom: PreferredSize(
          child: Container(
            color: Colors.orange,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(0.0),
        ),
        leading: IconButton(
          icon: Icon(Icons.navigate_before_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
//--------------------------------------------------------------------------------------------------------------//
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {},
        child: FutureBuilder<List<CompanyName>>(
          future: companyNameProvider,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
/* ****************************************************************************************************************** */
              case ConnectionState.active:
                return Text("");
                break;
/* ****************************************************************************************************************** */
              case ConnectionState.none:
                // TODO: Handle this case.
                return Center(
                  child: Text(snapshot.error),
                );
                break;
/* ****************************************************************************************************************** */
              case ConnectionState.waiting:
                // TODO: Handle this case.
                return Center(
                  child: CircularProgressIndicator(
                    // color: widget.color, //Colors.purple[900],
                    // size: 50.0,
                    backgroundColor: widget.color,
                  ),
                );
                break;
/* ****************************************************************************************************************** */
              case ConnectionState.done:
                // TODO: Handle this case.
                if (snapshot.hasData) {
                  return ListView.separated(
                    padding: EdgeInsets.only(top: 10.0, bottom: 50.0),
                    // controller: ScrollController(initialScrollOffset: 20.0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return CompanyMasterListTile(
                          width: width, snapshot: snapshot.data[i]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                  );
                } else {
                  return Center(
                    child: Text("No Data Found" + snapshot.error),
                  );
                }
                break;
            }
/* ****************************************************************************************************************** */
            return Center(
              child: CircularProgressIndicator(
                // color: widget.color, //Colors.purple[900],
                // size: 50.0,
                backgroundColor: widget.color,
              ),
            );
          },
        ),
      ),
/* ****************************************************************************************************************** */
      floatingActionButton: FadeAnimation(
        2,
        FloatingActionButton(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute( builder: (context) => CompanyEditView(header: "Add Company", companyName: CompanyName(),control: "add")));
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: CompanyEditView(
                    header: "Add Company",
                    companyName: CompanyName(),
                    control: "add"),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
/* ****************************************************************************************************************** */
    );
  }
}
