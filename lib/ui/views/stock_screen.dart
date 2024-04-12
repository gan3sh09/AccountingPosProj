import 'package:accounting_pos_project/ui/shared/drawer.dart';
import 'package:accounting_pos_project/ui/shared/header_nav.dart';
import 'package:accounting_pos_project/ui/widgets/section_header.dart';
import 'package:accounting_pos_project/ui/widgets/stock_screen.dart/stock_item_list.dart';
import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

    return Scaffold(
      key: drawerKey,
      appBar: headerNav(drawerKey),
      drawer: tassistDrawer(context),
      body: ListView(
        children: const <Widget>[
          SectionHeader(sectionText: 'Stock Items'),
          StockItemList()
        ],
      ),
    );
  }
}
