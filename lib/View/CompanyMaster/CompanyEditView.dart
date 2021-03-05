import 'package:DealerPortalApp/Component/ColorCode.dart';
import 'package:DealerPortalApp/Component/GlobalStringText.dart';
import 'package:DealerPortalApp/Helper/Connectivity.dart';
import 'package:DealerPortalApp/Helper/FadeAnimation.dart';
import 'package:DealerPortalApp/Model/Core/CompanyName.dart';
import 'package:DealerPortalApp/Model/Core/Message.dart';
import 'package:DealerPortalApp/Provider/CompanyNameProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompanyEditView extends StatefulWidget {
  final String header;
  final String control;
  final CompanyName companyName;
  CompanyEditView(
      {@required this.header, this.companyName, @required this.control});
  @override
  _CompanyEditViewState createState() => _CompanyEditViewState();
}

class _CompanyEditViewState extends State<CompanyEditView> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  ScrollController _scrollController = new ScrollController();
  // ConnectivityConn connectivity_conn;

  String Company, Description;
  bool _readOnly = false;
  TextEditingController _name = new TextEditingController();
  TextEditingController _description = new TextEditingController();

  bool _showCircularIndicator;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    final CompanyNameProvider _companyNameProvider = CompanyNameProvider();
    _name.text = widget.companyName.name;
    _description.text = widget.companyName.description;

//------------------------------------------------------------------------------------------------------------//

    Widget textFormFeild(
        {String title,
        bool readOnly,
        String Function(String) validate,
        @required TextEditingController controller,
        void Function(String) onSaved,
        void Function(String) onChanged}) {
      return new TextFormField(
        // focusNode: FocusNode(),
        readOnly: readOnly,
        controller: controller,
        validator: validate,
        onSaved: onSaved,
        onChanged: onChanged,
        // onSaved: (String val) {
        //   Title = val;
        // },
        decoration: new InputDecoration(
          border: new OutlineInputBorder(),
          hintText: title ?? 'Enter any detail',
          hintStyle:
              TextStyle(fontSize: 12.0, color: ColorCode.BlackTextColorCode),
          //helperText: 'Keep it short, this is just a demo.',
          labelText: 'Enter any detail',
          labelStyle: new TextStyle(
              fontSize: 14.0,
              color: ColorCode.BlackTextColorCode,
              fontWeight: FontWeight.w300),
          prefixIcon: const Icon(
            FontAwesomeIcons.briefcase,
            size: 15.0,
            color: Color(0xFFCEA910),
          ),
          prefixText: ' ',
          //suffixText: 'USD',
          //suffixStyle: const TextStyle(color: Colors.green)
        ),
      );
    }

//------------------------------------------------------------------------------------------------------------//

    Widget FormTextField() {
      return new Column(children: <Widget>[
        new FadeAnimation(
          2,
          Container(
            child: new ListView(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                controller: _scrollController,
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  textFormFeild(
                      readOnly: _readOnly,
                      title: widget.companyName.name,
                      validate: (String value) {
                        String patttern = r'';
                        RegExp regExp = new RegExp(patttern);
                        if (value.length == 0) {
                          return "Company is Required";
                        } else if (!regExp.hasMatch(value)) {
                          return "Company must be Need";
                        }
                        return null;
                      },
                      controller: _name,
                      // onSaved: (String val) {
                      //   Company = val;
                      // },
                      // onChanged: (String val) {
                      //   Company = val;
                      // }
                      ),
                  SizedBox(
                    height: 5.0,
                  ),
                  textFormFeild(
                    readOnly: _readOnly,
                    title: widget.companyName.description,
                    validate: (String value) {
                      String patttern = r'';
                      RegExp regExp = new RegExp(patttern);
                      if (value.length == 0) {
                        return "Company Descrition is Required";
                      } else if (!regExp.hasMatch(value)) {
                        return "Company Descrition must be Need";
                      }
                      return null;
                    },
                    controller: _description,
                    onSaved: (String val) {
                      Description = val;
                    },
                    onChanged: (String val) {
                      Description = val;
                    },
                  )
                ]),
          ),
        ),
      ]);
    }

//--------------------------------------------------------------------------------------------------------------------------------//
    showMessageBox(Message message) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Message'),
            content: Text(message.message),
            actions: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop;
                },
                child: Text('Ok'),
              )
            ],
          );
        },
      );
    }

//--------------------------------------------------------------------------------------------------------------------------------//
    void CompanyNameUpdate() async {
      var result;
      CompanyName _companyName = CompanyName(
          id: widget.companyName.id,
          name: _name.text,
          description: _description.text);
      switch (widget.control) {
        case 'add':
          result = await _companyNameProvider
              .createCompanyNameProvider(_companyName);
          break;
        case 'edit':
          result = await _companyNameProvider.updateCompanyNameProvider(
              _companyName, widget.companyName.id);
          break;
        case '':
          break;
      }
      final message2 = result.fold((l) {
        return l.message;
      }, (r) {
        return r.message;
      });
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
        // _key.currentState.save();
        // connectivity_conn.checkInternetConnectivity(context);
        CompanyNameUpdate();
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
          child: SingleChildScrollView(
            child: new Form(
              key: _key,
              // autovalidateMode: _validate,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  FormTextField(),
                  SizedBox(
                    height: 15.0,
                  ),
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
