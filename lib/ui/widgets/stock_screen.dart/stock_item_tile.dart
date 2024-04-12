import 'package:accounting_pos_project/ui/widgets/expansible_detail_card.dart';
import 'package:accounting_pos_project/ui/widgets/party_screen/ledger_card.dart';
import 'package:flutter/material.dart';

class StockItemTile extends StatelessWidget {
  const StockItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpansibleDetailCard(
      childdetailCard: ChildDetailCard(
        title1: 'Name',
        info1: 'Master Id',
        info2: 'CR: closing rate',
        info3: 'Closing Balance',
        info4: 'Closing Value',
      ),
      title1: 'Standard Cost',
      info1: 'standard cost',
      title2: 'Standard Price',
      info2: 'standard price',
      title3: 'Minimum Qty.',
      info3: 'Not available',
    );
  }
}
