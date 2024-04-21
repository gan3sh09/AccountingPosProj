import 'package:accounting_pos_project/theme/colors.dart';
import 'package:accounting_pos_project/theme/texts.dart';
import 'package:accounting_pos_project/ui/shared/drawer.dart';
import 'package:accounting_pos_project/ui/shared/header_nav.dart';
import 'package:accounting_pos_project/ui/views/voucher/payment_voucher_screen.dart';
import 'package:accounting_pos_project/ui/widgets/my_box_decoration.dart';
import 'package:flutter/material.dart';

class VoucherHome extends StatefulWidget {
  const VoucherHome({super.key});

  @override
  State<VoucherHome> createState() => _VoucherHomeState();
}

class _VoucherHomeState extends State<VoucherHome> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  String timePeriod = "Tomorrow";

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      appBar: headerNav(drawerKey),
      drawer: tassistDrawer(context),
      body: SizedBox(
        // height: MediaQuery.of(context).size.height / 1.1,
        child: Column(
          children: <Widget>[
            Container(
              decoration: myBoxDecorationBottomBorder(),
              // color: Colors.blueGrey[100],
              // width: MediaQuery.of(context).size.width,
              height: 35,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Limit: last 2000 vouchers",
                      style: secondaryListDisc.copyWith(color: tassistInfoGrey),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   decoration: myBoxDecorationBottomBorder(),
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(4.0, 1.0, 10.0, 1.0),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Text(
            //           "Select timeperiod",
            //           style: secondaryListTitle2,
            //         ),
            //         PopupMenuButton<String>(
            //           icon: Icon(Icons.av_timer),
            //           onSelected: (value) {
            //             setState(() {
            //               timePeriod = value;
            //             });
            //           },
            //           itemBuilder: (BuildContext context) {
            //             return timePeriodList.map(
            //               (String choice) {
            //                 return PopupMenuItem<String>(
            //                   value: choice,
            //                   child: Text(
            //                     choice,
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.normal,
            //                         fontSize: 14.0),
            //                   ),
            //                 );
            //               },
            //             ).toList();
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            //   // color: Colors.blueGrey[100],
            //   // width: MediaQuery.of(context).size.width,
            //   height: 35,
            // ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  /* SalesVoucherScreen(timePeriod: timePeriod),
                  PurchaseVoucherScreen(timePeriod: timePeriod),
                  ReceiptVoucherScreen(timePeriod: timePeriod), */
                  PaymentVoucherScreen(timePeriod: timePeriod),
                ],
              ),
            ),
          ], // child:
        ),
      ),
    );
  }
}
