import 'package:DealerPortalApp/Component/ColorCode.dart';
import 'package:DealerPortalApp/Helper/FadeAnimation.dart';
import 'package:DealerPortalApp/Helper/stickyGroupedListView.dart';
import 'package:DealerPortalApp/Provider/CustomerOrderProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:DealerPortalApp/Provider/CustomerOrderProvider.dart';
import 'package:DealerPortalApp/Model/Core/CustomerOrder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

import 'CustomerOrderEditView.dart';
import './CustomerOrderEditView2.dart';
import 'customerOrderListTile.dart';

class CustomerOrderMaster extends StatefulWidget {
  final String title;
  final Color color;
  CustomerOrderMaster({key, this.title, this.color}) : super(key: key);
  @override
  _CustomerOrderMasterState createState() => _CustomerOrderMasterState();
}

class _CustomerOrderMasterState extends State<CustomerOrderMaster> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

/* ****************************************************************************************************************** */
  @override
  Widget build(BuildContext context) {
    final customerOrderProvider = Provider.of<CustomerOrderProvider>(context);
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
            //Text("Nursery & Primary School",style:Theme.of(context).primaryTextTheme.subtitle2.copyWith(color: Colors.grey[300]))
            // Text("Nursery & Primary School", style: TextStyle(fontSize: 12.0, color: Colors.grey[300]))
          ],
        ),
      ),
//--------------------------------------------------------------------------------------------------------------//
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {},
        child: FutureBuilder<List<CustomerOrder>>(
          future: customerOrderProvider.getAllCustomerOrderProvider(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
/* ****************************************************************************************************************** */
              case ConnectionState.active:
                return Text("No Data Display");
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
                  return snapshot.data.length == 0 ? Center(child:Text("No Data Found")) :CustomerOrderListTile(snapshot: snapshot);
                  // return CustomerOrderListTile(snapshot: snapshot);

                  // StickyGroupedListViewHelper<CustomerOrder>(
                  //   elements: snapshot.data,
                  //   groupBy: (CustomerOrder custorder) => DateTime(custorder.createdAt.year,custorder.createdAt.month,custorder.createdAt.day),
                  //   groupComparator: (DateTime value1, DateTime value2) => value2.compareTo(value1),
                  //   itemComparator: (CustomerOrder custorder1, CustomerOrder custorder2) => custorder1.createdAt.compareTo(custorder2.createdAt),
                  //   day: snapshot.reatedAt.day,
                  //   month: custorder.createdAt.month
                  // );
//                   return ListView.builder(
//                     padding: EdgeInsets.only(top: 10.0, bottom: 50.0),
//                     // controller: ScrollController(initialScrollOffset: 20.0),
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (context, i) {
//                       return FadeAnimation(2,
//                         new Container(
//                           margin: EdgeInsets.symmetric(horizontal: width / 25, vertical: 5.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: new BorderRadius.circular(5.0),
//                             // gradient: LinearGradient(
//                             //   colors: [
//                             //     Colors.blue[700],
//                             //     Colors.blue[300],
//                             //   ]
//                             // )
//                           ),
//                           child: ListTile(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   // MaterialPageRoute(
//                                   //     builder: (context) =>
//                                   //         CustomerOrderView(header: "Edit Company",
//                                   //             CustomerOrder:
//                                   //                 snapshot.data[i], control: 'edit',),),);
//                                   PageTransition(type: PageTransitionType.rightToLeftWithFade, child: CustomerOrderView(header: "Edit Company",
//                                               customerOrder:
//                                                   snapshot.data[i], control: 'edit',),),);
//                             },
//                             leading: CircleAvatar(
//                                 child: Text(snapshot.data[i].name
//                                     .substring(0, 1)
//                                     .toUpperCase(),),),
//                             title: Text(snapshot.data[i].name),//, style: GoogleFonts.sanchez()),
//                            subtitle: Text(snapshot.data[i].contactPerson),//, style: GoogleFonts.sanchez()),
// /* ****************************************************************************************************************** */
//                             trailing: IconButton(
//                               onPressed: () async{
//                                 var _CustomerOrderProvider = CustomerOrderProvider();
//                                 final result = await _CustomerOrderProvider.deleteCustomerOrderProvider(snapshot.data[i].id);
//                                 final message = result.fold((l){
//                                   return l.toString();
//                                 },(r){
//                                   return r.message;
//                                 },);
//                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//                                 // Navigator.of(context).pop();
//                               },
//                               icon: Icon(Icons.delete,color: Colors.red,size: 20.0)
//                             ),
// /* ****************************************************************************************************************** */
//                           ),
//                         ),
//                       );
//                     }
//                   );
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
            // Navigator.push(context, MaterialPageRoute( builder: (context) => CustomerOrderView(header: "Add Company", CustomerOrder: CustomerOrder(),control: "add")));
            // CustomerOrder _customerOrder = CustomerOrder(
            //   id: 0,
            //   transactionDate: DateTime.now(),
            //   companyId: 0,
            //   userId: 0,
            //   name: "_companyName.text",
            //   contactPerson: "_contactPerson.text",
            //   contactNo: "_contactNo.text",
            //   purpose: "_purpose.text",
            //   order: 2345,
            // );
            // debugPrint("_customerOrder.toJson().toString()");
            // print(_customerOrder.toJson().toString());
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: CustomerOrderView2(
                  header: "Add Company",
                  customerOrder: CustomerOrder(),
                  control: "add",
                ),
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
