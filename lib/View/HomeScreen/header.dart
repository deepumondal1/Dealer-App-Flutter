import 'package:DealerPortalApp/Component/ColorCode.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './chartView.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Expense {
  final String category;
  final double value;
  final Color color;
  const Expense(this.category, this.value, this.color);
}

class Header extends StatelessWidget {
  final Function viewOnline;

  const Header(this.viewOnline);

  static List<charts.Series<Expense, String>> _series = [
    charts.Series<Expense, String>(
      id: 'Maximum Order',
      domainFn: (Expense exp, _) => exp.category,
      measureFn: (Expense exp, _) => exp.value,
      labelAccessorFn: (Expense exp, _) => '${exp.value}',
      colorFn: (Expense exp, _) => charts.ColorUtil.fromDartColor(exp.color),
      data: [
        Expense('Rahul', 149.00, Color(0xff40bad5)),
        Expense('Sourab', 143.00, Color(0xffe8505b)),
        Expense('Sikandar', 49.00, Colors.pink),
        Expense('Raj', 27.00, Colors.green),
        Expense('Pihu', 34.00, Colors.yellow),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: mediaQuery.size.height * 0.4,
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: mediaQuery.size.height * 0.2,
            child: ChartView(_series, animate: true),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              OutlinedButton(
                onPressed: viewOnline,
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                child: Container(
                  width: 124,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.playlist_add,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Online Status",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ReportView');
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    ColorCode.WhiteTextColorCode,
                  ),
                ),
                child: Container(
                  width: 72,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Reports",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: ColorCode.AppColorCode,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: ColorCode.AppColorCode,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "Users Online",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: ColorCode.WhiteTextColorCode,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
