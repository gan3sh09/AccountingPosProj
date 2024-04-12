// ignore_for_file: unnecessary_null_comparison

import 'package:accounting_pos_project/ui/views/detail_card.dart';
import 'package:accounting_pos_project/ui/widgets/party_screen/ledger_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var formatter = DateFormat('dd-MM-yyyy');

/* _formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
} */

class LedgerItemTileNew extends StatelessWidget {
  const LedgerItemTileNew({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LedgerCard(
          childdetailCard: ChildDetailCard(
            title1: 'Name',
            info1: 'Master Id',
            info2: 'State',
            info3: 'Sales:',
            info4: 'Receipt:',
          ),
          title1: 'Receivables',
          info1: 'Closing Balance',
          title2: 'Last Sale',
          info2: 'Last sales date',
          title3: 'Last Receipt',
          info3: 'Last receipt date',
        ),
        LedgerCard(
          childdetailCard: ChildDetailCard(
            title1: 'Name',
            info1: 'Master Id',
            info2: 'Company Code',
            info3: 'Total Purchase:',
            info4: 'Total Payment:',
          ),
          title1: 'Payables',
          info1: 'Closing Balance',
          title2: 'Last Purchase',
          info2: 'Last purchase date',
          title3: 'Last Payment',
          info3: 'Last payment date',
        ),
        DetailCard(
            title1: 'Name',
            info1: 'Master Id',
            info2: 'Company Code',
            info3: 'Closing: Rs.9760000',
            info4: 'Opening: Rs. 200000'),
      ],
    );
  }
}
