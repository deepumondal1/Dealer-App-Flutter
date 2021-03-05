import 'package:DealerPortalApp/Component/ColorCode.dart';
import 'package:DealerPortalApp/Helper/FadeAnimation.dart';
import 'package:DealerPortalApp/Model/Core/CustomerOrder.dart';
import 'package:DealerPortalApp/Provider/CustomerOrderProvider.dart';
import 'package:intl/intl.dart';
import './CustomerOrderEditView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

import 'CustomerOrderEditView2.dart';

class CustomerOrderListTile extends StatelessWidget {
  const CustomerOrderListTile({
    Key key,
    this.snapshot,
  }) : super(key: key);

  final snapshot;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      2,
      StickyGroupedListView<CustomerOrder, DateTime>(
        elements: snapshot.data,
        groupBy: (CustomerOrder custorder) => DateTime(
            custorder.transactionDate.year,
            custorder.transactionDate.month,
            custorder.transactionDate.day),
        groupComparator: (DateTime value1, DateTime value2) =>
            value2.compareTo(value1),
        itemComparator: (CustomerOrder custorder1, CustomerOrder custorder2) =>
            custorder1.transactionDate.compareTo(custorder2.transactionDate),
        floatingHeader: true,
        groupSeparatorBuilder: (CustomerOrder element) => Container(
          height: 50,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                border: Border.all(
                  color: Colors.blue[300],
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  DateFormat("dd MMMM,yyyy").format(element.transactionDate),
                  // DateFormat("dd MMMM,yyyy").format(element.createdAt),
                  // '${element.createdAt.day}. ${element.createdAt.month}. ${element.createdAt.year}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        itemBuilder: (_, CustomerOrder element) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      // child: CustomerOrderView(
                      //   header: "Edit Company",
                      //   customerOrder: element,
                      //   control: 'edit',
                      // ),
                      child: CustomerOrderView2(
                        header: "Edit Company",
                        customerOrder: element,
                        control: 'edit',
                      ),
                    ),
                  );
                },
                // contentPadding: EdgeInsets.symmetric(
                //     horizontal: 20.0, vertical: 10.0),

                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ColorCode.AppColorCode),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    element.name.substring(0, 1).toUpperCase(),
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  element.contactPerson,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(element.name),
                // trailing: Text('${hour}:00'),
/* ****************************************************************************************************************** */
                trailing: IconButton(
                  onPressed: () async {
                    var message;
                    var _customerOrderProvider = CustomerOrderProvider();
                    final result = await _customerOrderProvider
                        .deleteCustomerOrderProvider(element.id)
                        .onError((error, stackTrace) => null);

                    if (result != null) {
                      message = result.fold(
                        (l) {
                          return l.toString();
                        },
                        (r) {
                          return r.message;
                        },
                      );
                    } else {
                      message = "Nothing Changed";
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  icon: CircleAvatar(
                    child: Icon(Icons.delete, color: Colors.red, size: 18.0),
                    backgroundColor: Colors.red.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
