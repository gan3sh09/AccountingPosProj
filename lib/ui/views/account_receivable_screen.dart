import 'package:accounting_pos_project/ui/shared/drawer.dart';
import 'package:accounting_pos_project/ui/shared/header_nav.dart';
import 'package:accounting_pos_project/ui/views/account_receivable_list.dart';
import 'package:accounting_pos_project/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';

class AccountsReceivableScreen extends StatelessWidget {
  const AccountsReceivableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

    return SafeArea(
      child: Scaffold(
        key: drawerKey,
        appBar: headerNav(drawerKey),
        drawer: tassistDrawer(context),
        body: ListView(
          children: const <Widget>[
            SectionHeader(sectionText: 'Accounts Receivables'),
            // Text('Dummy data, coming soon!'),
            // Padding(
            //   padding: spacer.all.xs,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: <Widget>[
            //      BigMetricNoIcon('30', '<30 days', TassistSuccess),
            //      BigMetricNoIcon('12', '30-45 days', TassistWarning),
            //      BigMetricNoIcon('16', '45-60 days', TassistDanger),
            //     ],
            //   ),
            // ),
            // SecondarySectionHeader('List of parties'),

            ARLedgerItemList(),
            // Padding(
            //   padding: spacer.y.xs,
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: <Widget>[
            //         Column(
            //           children: <Widget>[
            //           Icon(Icons.mail, color: TassistPrimary,),
            //           Text('Email All', style: Theme.of(context).textTheme.bodyText1,)
            //           ]
            //         ),
            //         Column(
            //           children: <Widget>[
            //           Icon(Icons.timer, color: TassistPrimary,),
            //           Text('Remind All', style: Theme.of(context).textTheme.bodyText1,)
            //           ]
            //         ),
            //         Column(
            //           children: <Widget>[
            //           Icon(Icons.add_alert, color: TassistPrimary,),
            //           Text('Alert Sales', style: Theme.of(context).textTheme.bodyText1,)
            //           ]
            //         )
            //       ]
            //   ),
            // ),
            // GoToBar('Sales Order Report', SalesOrderReportScreen())
          ],
        ),
      ),
    );
  }
}
