import 'package:accounting_pos_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class APSingleItem extends StatelessWidget {
  const APSingleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      child: FittedBox(
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.8,
              child: Text(
                'Ledger Item name',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14, color: tassistPrimaryBackground),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 80,
              child: Text(
                'Closing Balance',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14, color: tassistBlack),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            // Text(
            //   '${formatIndianCurrency(ledgerItem.totalPayment)}',
            //   style: TextStyle(color: TassistInfoGrey),
            // ),
            IconButton(
              onPressed: () {
                // _launchURL();
              },
              iconSize: 20,
              icon: const Icon(
                FontAwesomeIcons.whatsapp,
                color: tassistSuccess,
              ),
            )
          ],
        ),
      ),
    );
  }
}
