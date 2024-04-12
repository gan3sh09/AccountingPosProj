import 'package:accounting_pos_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleItem extends StatelessWidget {
  const SingleItem({super.key});

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
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: Text(
                'LedgerItem Name',
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
            Container(
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
            // Container(
            //   padding: spacer.all.xxs,
            //   margin: EdgeInsets.all(1),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: TassistGray
            //   )
            //   ),
            //     Container(
            //   padding: spacer.all.xxs,
            //   margin: EdgeInsets.all(1),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: TassistGray
            //   )
            //   ),
            //     Container(
            //   padding: spacer.all.xxs,
            //   margin: EdgeInsets.all(1),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: TassistGray
            //   )
            //   ),
            //     Container(
            //   padding: spacer.all.xxs,
            //   margin: EdgeInsets.all(1),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: TassistSuccess
            //   )
            //   ),
            //     Container(
            //   padding: spacer.all.xxs,
            //   margin: EdgeInsets.all(1),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: TassistSuccessLight
            //   )
            //   ),
            //     Container(
            //   padding: spacer.all.xxs,
            //   margin: EdgeInsets.all(1),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: TassistGray
            //   )
            //   ),
            // Text(
            //   '${formatIndianCurrency(ledgerItem.totalReceipt)}',
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
