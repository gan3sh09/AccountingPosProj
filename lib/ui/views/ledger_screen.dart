import 'package:accounting_pos_project/ui/shared/drawer.dart';
import 'package:accounting_pos_project/ui/shared/header_nav.dart';
import 'package:accounting_pos_project/ui/widgets/party_screen/ledger_item_list.dart';
import 'package:accounting_pos_project/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';

class LedgerScreen extends StatelessWidget {
  const LedgerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

    return Scaffold(
      key: drawerKey,
      appBar: headerNav(drawerKey),
      drawer: tassistDrawer(context),
      body: ListView(
        children: const <Widget>[
          SectionHeader(sectionText: 'Ledgers'),
          LedgerItemList(),
        ],
      ),
    );
  }
}
