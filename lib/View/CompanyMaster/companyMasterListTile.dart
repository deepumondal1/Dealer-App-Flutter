import 'package:DealerPortalApp/Component/ColorCode.dart';
import 'package:DealerPortalApp/Helper/FadeAnimation.dart';
import 'package:DealerPortalApp/Provider/CompanyNameProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import './CompanyEditView.dart';
import 'CompanyEditView2.dart';

class CompanyMasterListTile extends StatelessWidget {
  const CompanyMasterListTile({
    Key key,
    @required this.width,
    @required this.snapshot,
  }) : super(key: key);

  final double width;
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      2,
      new Container(
        // margin: EdgeInsets.symmetric(horizontal: width / 25, vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(5.0),
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.blue[700],
          //     Colors.blue[300],
          //   ]
          // )
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: CompanyEditView(
                  header: "Edit Company",
                  companyName: snapshot,
                  control: 'edit',
                ),
                // child: CompanyEditView2(),
              ),
            );
          },
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorCode.AppColorCode),
            ),
            alignment: Alignment.center,
            child: Text(
              snapshot.name.substring(0, 1).toUpperCase(),
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            snapshot.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ), //, style: GoogleFonts.sanchez()),
          subtitle: Text(
            snapshot.name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ), //, style: GoogleFonts.sanchez()),
/* ****************************************************************************************************************** */
          trailing: IconButton(
            onPressed: () async {
              var _companyNameProvider = CompanyNameProvider();
              final result = await _companyNameProvider
                  .deleteCompanyNameProvider(snapshot.id)
                  .onError((error, stackTrace) => null);
              var message;
              message = result?.fold(
                (l) {
                  return l.toString();
                },
                (r) {
                  return r.message;
                },
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message??"Nothing Changed"),
                ),
              );
              // Navigator.of(context).pop();
            },
            icon: CircleAvatar(
              child: Icon(Icons.delete, color: Colors.red, size: 18.0),
              backgroundColor: Colors.red.withOpacity(0.2),
            ),
          ),
/* ****************************************************************************************************************** */
        ),
      ),
    );
  }
}
