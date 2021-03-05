import 'package:DealerPortalApp/Model/Core/CustomerOrder.dart';
import 'package:DealerPortalApp/Provider/CustomerOrderProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReportView extends StatefulWidget {
  final String title;
  final Color color;
  ReportView({key, this.title, this.color}) : super(key: key);
  @override
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final customerOrderProvider = Provider.of<CustomerOrderProvider>(context)
        .getAllCustomerOrderProvider();
    // final customerOrderProvider = Provider.of<CustomerOrderProvider>(context).getAllCustomerOrderProvider();
    // List<CustomerOrder> customerOrder = customerOrderProvider

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
      // body: StreamBuilder(
      //     stream: Stream.periodic(Duration(milliseconds: 5000))
      //         .asyncMap((i) => customerOrderProvider),
      body: FutureBuilder<List<CustomerOrder>>(
        future: customerOrderProvider,
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
                child: Text("No Data " + snapshot.error),
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
                return SingleChildScrollView(
                  child: PaginatedDataTable(
                    sortColumnIndex: 0,
                    header: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Report',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold)),
                        Text('Total : ${snapshot.data.length}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    rowsPerPage: _rowsPerPage,
                    availableRowsPerPage: const <int>[5, 10, 20],
                    onRowsPerPageChanged: (int value) {
                      setState(() {
                        _rowsPerPage = value;
                      });
                    },
                    columns: kTableColumns,
                    source:
                        ReportDataSource(customerOrderProvider: snapshot.data),
                  ),
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
    );
  }
}

// DataCell(Text(DateFormat("dd/mm/yyyy").format(customerOrder.transactionDate))),
// DataCell(Text(customerOrder.name)),
// DataCell(Text(customerOrder.contactPerson)),
// DataCell(Text(customerOrder.contactNo)),
// DataCell(Text(customerOrder.purpose)),
// DataCell(Text(customerOrder.order)),
////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: Text('Transaction Date'),
    // onSort: (index, ascending){}
  ),
  DataColumn(
    label: Text('Company Name'),
  ),
  DataColumn(
    label: Text('Contact Person'),
  ),
  DataColumn(
    label: Text('Contact Number'),
  ),
  DataColumn(
    label: Text('Purpose'),
  ),
  DataColumn(
    label: Text('Order'),
  ),
];

////// Data class.
// class Report {
//   Report(this.name, this.calories, this.fat, this.carbs, this.protein,
//       this.sodium, this.calcium, this.iron);
//   final String name;
//   final int calories;
//   final double fat;
//   final int carbs;
//   final double protein;
//   final int sodium;
//   final int calcium;
//   final int iron;
//   bool selected = false;
//}

////// Data source class for obtaining row data for PaginatedDataTable.
class ReportDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<CustomerOrder> customerOrderProvider;
  ReportDataSource({this.customerOrderProvider});

  // final List<Report> _reports = <Report>[
  //   Report('Frozen yogurt', 159, 6.0, 24, 4.0, 87, 14, 1),
  //   Report('Ice cream sandwich', 237, 9.0, 37, 4.3, 129, 8, 1),
  //   Report('Eclair', 262, 16.0, 24, 6.0, 337, 6, 7),
  //   Report('Cupcake', 305, 3.7, 67, 4.3, 413, 3, 8),
  //   Report('Gingerbread', 356, 16.0, 49, 3.9, 327, 7, 16),
  //   Report('Jelly bean', 375, 0.0, 94, 0.0, 50, 0, 0),
  //   Report('Lollipop', 392, 0.2, 98, 0.0, 38, 0, 2),
  //   Report('Honeycomb', 408, 3.2, 87, 6.5, 562, 0, 45),
  //   Report('Donut', 452, 25.0, 51, 4.9, 326, 2, 22),
  //   Report('KitKat', 518, 26.0, 65, 7.0, 54, 12, 6),
  //   Report('Frozen yogurt with sugar', 168, 6.0, 26, 4.0, 87, 14, 1),
  //   Report('Ice cream sandwich with sugar', 246, 9.0, 39, 4.3, 129, 8, 1),
  //   Report('Eclair with sugar', 271, 16.0, 26, 6.0, 337, 6, 7),
  //   Report('Cupcake with sugar', 314, 3.7, 69, 4.3, 413, 3, 8),
  //   Report('Gingerbread with sugar', 345, 16.0, 51, 3.9, 327, 7, 16),
  //   Report('Jelly bean with sugar', 364, 0.0, 96, 0.0, 50, 0, 0),
  //   Report('Lollipop with sugar', 401, 0.2, 100, 0.0, 38, 0, 2),
  // ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= customerOrderProvider.length) return null;
    final CustomerOrder customerOrder = customerOrderProvider[index];
    return DataRow.byIndex(
        index: index,
        selected: customerOrder.selected,
        onSelectChanged: (bool value) {
          if (customerOrder.selected != value) {
            _selectedCount += value ? 1 : -1;
            assert(_selectedCount >= 0);
            customerOrder.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text(
              DateFormat("dd/MM/yyyy").format(customerOrder.transactionDate))),
          DataCell(Text(customerOrder.name)),
          DataCell(Text(customerOrder.contactPerson)),
          DataCell(Text(customerOrder.contactNo)),
          DataCell(Text(customerOrder.purpose)),
          DataCell(Text(customerOrder.order)),
        ]);
    // final Report report = _reports[index];
    // return DataRow.byIndex(
    //     index: index,
    //     selected: report.selected,
    //     onSelectChanged: (bool value) {
    //       if (report.selected != value) {
    //         _selectedCount += value ? 1 : -1;
    //         assert(_selectedCount >= 0);
    //         report.selected = value;
    //         notifyListeners();
    //       }
    //     },
    //     cells: <DataCell>[
    //       DataCell(Text(report.name)),
    //       DataCell(Text('${report.calories}')),
    //       DataCell(Text(report.fat.toStringAsFixed(1))),
    //       DataCell(Text('${report.carbs}')),
    //       DataCell(Text(report.protein.toStringAsFixed(1))),
    //       DataCell(Text('${report.sodium}')),
    //       DataCell(Text('${report.calcium}%')),
    //       DataCell(Text('${report.iron}%')),
    //     ]);
  }

  @override
  int get rowCount => customerOrderProvider.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
