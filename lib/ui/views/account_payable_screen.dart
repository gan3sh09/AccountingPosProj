import 'package:accounting_pos_project/ui/shared/drawer.dart';
import 'package:accounting_pos_project/ui/shared/header_nav.dart';
import 'package:accounting_pos_project/ui/widgets/account_payable/account_payable_list.dart';
import 'package:accounting_pos_project/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';

class AccountsPayableScreen extends StatelessWidget {
  const AccountsPayableScreen({super.key});

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
            SectionHeader(sectionText: 'Accounts Payables'),
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
            APLedgerItemList(),
      
          ],


        )
    ));
  }
}
