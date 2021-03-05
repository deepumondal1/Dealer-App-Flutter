import 'package:DealerPortalApp/Component/ColorCode.dart';
import 'package:DealerPortalApp/Component/GlobalStringText.dart';
import 'package:DealerPortalApp/Helper/Connectivity.dart';
import 'package:DealerPortalApp/Helper/FadeAnimation.dart';
import 'package:DealerPortalApp/Helper/FormHelper.dart';
import 'package:DealerPortalApp/Model/Core/CompanyName.dart';
import 'package:DealerPortalApp/Model/Core/CustomerOrder.dart';
import 'package:DealerPortalApp/Model/Core/Message.dart';
import 'package:DealerPortalApp/Provider/CompanyNameProvider.dart';
import 'package:DealerPortalApp/Provider/CustomerOrderProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomerOrderView2 extends StatefulWidget {
  final String header;
  final String control;
  final CustomerOrder customerOrder;
  CustomerOrderView2(
      {@required this.header, this.customerOrder, @required this.control});
  @override
  _CustomerOrderView2State createState() => _CustomerOrderView2State();
}

class _CustomerOrderView2State extends State<CustomerOrderView2> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  ScrollController _scrollController = new ScrollController();
  // ConnectivityConn connectivity_conn;

  // String Company, Description;
  bool _readOnly = false;
  DateTime _dateTime;
  String _companyName;
  String _contactPerson;
  String _contactNo;
  String _purpose;
  String _order;

  // DateTime _dateTime = DateTime.now();
  TextEditingController _companyNameCntrl = new TextEditingController();
  TextEditingController _contactPersonCntrl = new TextEditingController();
  TextEditingController _contactNoCntrl = new TextEditingController();
  TextEditingController _purposeCntrl = new TextEditingController();
  TextEditingController _orderCntrl = new TextEditingController();

  // bool _showCircularIndicator;
  final CustomerOrderProvider _customerOrderProvider = CustomerOrderProvider();

  List<CompanyName> companies;

  @override
  initState() async {
    super.initState();
    _dateTime = widget.customerOrder.transactionDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    print(_dateTime);
    debugPrint(_dateTime.toString());
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    // _dateTime = widget.customerOrder.transactionDate ?? DateTime.now();
    // _companyNameCntrl.text = widget.customerOrder.name;
    _companyName = widget.customerOrder.name ?? "";
    _contactPerson = widget.customerOrder.contactPerson ?? "";
    _contactNo = widget.customerOrder.contactNo ?? "";
    _purpose = widget.customerOrder.purpose ?? "";
    _order = widget.customerOrder.order ?? "";

    // _dateTime = widget.customerOrder.transactionDate;
    _companyNameCntrl.text = widget.customerOrder.name;
    _contactPersonCntrl.text = widget.customerOrder.contactPerson;
    _contactNoCntrl.text = widget.customerOrder.contactNo;
    _purposeCntrl.text = widget.customerOrder.purpose;
    _orderCntrl.text = widget.customerOrder.order;
    // final result = _customerOrderProvider.getAllCustomerOrderProvider();

//--------------------------------------------------------------------------------------------------------------------------------//
    void CustomerOrderUpdate() async {
      var result;
      var message2;
      CustomerOrder _customerOrder = CustomerOrder(
        id: widget.customerOrder.id,
        transactionDate: _dateTime,
        // companyId: 0,
        // userId: 0,
        // name: _companyName,
        // contactPerson: _contactPerson,
        // contactNo: _contactNo,
        // purpose: _purpose,
        // order: _order,

        name: _companyNameCntrl.text,
        contactPerson: _contactPersonCntrl.text,
        contactNo: _contactNoCntrl.text,
        purpose: _purposeCntrl.text,
        order: _orderCntrl.text,
      );
      switch (widget.control) {
        case 'add':
          result = await _customerOrderProvider
              .createCustomerOrderProvider(_customerOrder)
              .onError((error, stackTrace) => null);
          break;
        case 'edit':
          result = await _customerOrderProvider
              .updateCustomerOrderProvider(
                  _customerOrder, widget.customerOrder.id)
              .onError((error, stackTrace) => null);
          break;
        case '':
          break;
      }
      if (result != null) {
        message2 = result.fold((l) {
          return l.message;
        }, (r) {
          return r.message;
        });
      } else {
        message2 = "Nothing Changed";
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message2)));
      Navigator.of(context).pop();
      //showMessageBox(message);
    }

//------------------------------------------------------------------------------------------------------------//
    _sendToServer() {
      if (_key.currentState.validate()) {
        setState(() {
          _readOnly = !_readOnly;
        });
        FocusScope.of(context).unfocus();
        _key.currentState.save();
        // connectivity_conn.checkInternetConnectivity(context);
        CustomerOrderUpdate();
      } else {
        // validation error
        setState(() {
          _validate = true;
        });
      }
    }

//--------------------------------------------------------------------------------------------------------------------------------//
    Widget FormBtnCancelSave() {
      return FadeAnimation(
        2,
        Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: new TextButton.icon(
                  // shape: new RoundedRectangleBorder(
                  //     borderRadius: new BorderRadius.circular(18.0),
                  //     side: BorderSide(color: ColorCode.AppColorCode)),
                  // color: ColorCode.AppColorCode,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorCode.AppColorCode),
                  ),
                  icon: Icon(
                    FontAwesomeIcons.solidPaperPlane,
                    color: Colors.white,
                    size: 18.0,
                  ), //`Icon` to display
                  label: Text("SUBMIT", //GlobalStringText.Submit.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )), //`Text` to display
                  onPressed: () {
                    _sendToServer();
                  },
                ),
              ),
              new Container(
                color: ColorCode.WhiteTextColorCode,
                height: 50.0,
                width: 2.0,
              ),
              Expanded(
                child: new TextButton.icon(
                  // shape: new RoundedRectangleBorder(
                  //     borderRadius: new BorderRadius.circular(18.0),
                  //     side: BorderSide(color: Colors.grey)),
                  // color: Colors.grey,
                  // color: Colors.red,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  icon: Icon(
                    FontAwesomeIcons.windowClose,
                    color: Colors.white,
                    size: 18.0,
                  ), //`Icon` to display
                  label: Text(GlobalStringText.Cancle.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )), //`Text` to display
                  //onPressed: _sendToServer(context),
                  onPressed: () {
                    // _sendToServer(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Noting Changed")));
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
//------------------------------------------------------------------------------------------------------------//

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
              widget.header,
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

      body: new FadeAnimation(
        2,
        Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: new Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  //  ------------------------------ COMPANY NAME --------------
                  OutlinedButton(
                    onPressed: () {
                      print(_dateTime);
                      debugPrint(_dateTime.toString());
                      showDatePicker(
                        context: context,
                        initialDate:
                            _dateTime.day == null ? _dateTime : DateTime.now(),
                        // currentDate:
                        //     _dateTime.day == null ? _dateTime : DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now(),
                      ).then((date) {
                        print(date);
                        if (date != null) {
                          setState(() {
                            _dateTime = date;
                          });
                        }
                      }).catchError((e) => print(e));
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                    child:
                        Text('${DateFormat("dd MMMM yyyy").format(_dateTime)}'),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //  ------------------------------ COMPANY NAME --------------
                  TextFormFieldHelper(
                    readOnly: _readOnly,
                    // controller: _companyNameCntrl,
                    initialValue: _companyName,
                    textVal: _companyName,
                    keyboardType: TextInputType.name,
                    labelText: "COMPANY NAME",
                    onChanged: (String val) {
                      setState(() {
                        // _companyName = val;
                        _companyNameCntrl.text = val;
                      });
                    },
                    onSaved: (String val) {
                      setState(() {
                        // _companyName = val;
                        _companyNameCntrl.text = val;
                      });
                    },
                    icon: Icons.business_center_outlined,
                    // focus: () => FocusScope.of(context).nextFocus(),
                    // unfocus: () -> FocusScope.of(context).unfocus(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //  ------------------------------ COMPANY NAME --------------
                  TextFormFieldHelper(
                    readOnly: _readOnly,
                    // controller: _contactPerson,
                    initialValue: _contactPerson,
                    textVal: _contactPerson,
                    keyboardType: TextInputType.name,
                    labelText: "CONTACT PERSON",
                    onChanged: (String val) {
                      setState(() {
                        // _contactPerson = val;
                        _contactPersonCntrl.text = val;
                      });
                    },
                    onSaved: (String val) {
                      setState(() {
                        // _contactPerson = val;
                        _contactPersonCntrl.text = val;
                      });
                    },
                    icon: Icons.business_center_outlined,
                    // focus: () => FocusScope.of(context).nextFocus(),
                    // unfocus: () -> FocusScope.of(context).unfocus(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //  ------------------------------ COMPANY NAME --------------
                  TextFormFieldHelper(
                    readOnly: _readOnly,
                    // controller: _contactNo,
                    initialValue: _contactNo,
                    textVal: _contactNo,
                    regExpPattern: r'[0-9]{10,15}$',
                    keyboardType: TextInputType.number,
                    labelText: "CONTACT NO",
                    onChanged: (String val) {
                      setState(() {
                        // _contactNo = val;
                        _contactNoCntrl.text = val;
                      });
                    },
                    onSaved: (String val) {
                      setState(() {
                        // _contactNo = val;
                        _contactNoCntrl.text = val;
                      });
                    },
                    minLine: 1,
                    maxLen: 10,
                    icon: Icons.business_center_outlined,
                    // focus: () => FocusScope.of(context).nextFocus(),
                    // unfocus: () -> FocusScope.of(context).unfocus(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //  ------------------------------ COMPANY NAME --------------
                  TextFormFieldHelper(
                    readOnly: _readOnly,
                    // controller: _purpose,
                    initialValue: _purpose,
                    textVal: _purpose,
                    keyboardType: TextInputType.text,
                    labelText: "PURPOSE",
                    onChanged: (String val) {
                      setState(() {
                        // _purpose = val;
                        _purposeCntrl.text = val;
                      });
                    },
                    onSaved: (String val) {
                      setState(() {
                        // _purpose = val;
                        _purposeCntrl.text = val;
                      });
                    },
                    minLine: 3,
                    maxLen: 500,
                    icon: Icons.business_center_outlined,
                    // focus: () => FocusScope.of(context).nextFocus(),
                    // unfocus: () -> FocusScope.of(context).unfocus(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //  ------------------------------ COMPANY NAME --------------
                  TextFormFieldHelper(
                    readOnly: _readOnly,
                    // controller: _order,
                    initialValue: _order,
                    textVal: _order,
                    keyboardType: TextInputType.text,
                    labelText: "ORDER",
                    onChanged: (String val) {
                      setState(() {
                        // _order = val;
                        _orderCntrl.text = val;
                      });
                    },
                    onSaved: (String val) {
                      setState(() {
                        // _order = val;
                        _orderCntrl.text = val;
                      });
                    },
                    icon: Icons.business_center_outlined,
                    // focus: () => FocusScope.of(context).nextFocus(),
                    // unfocus: () -> FocusScope.of(context).unfocus(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //  ------------------------------ FORM BUTTON CANCEL SAVE-------------
                  FormBtnCancelSave(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
