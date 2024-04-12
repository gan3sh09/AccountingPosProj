import 'package:accounting_pos_project/theme/dimensions.dart';
import 'package:accounting_pos_project/ui/widgets/party_screen/ledger_card.dart';
import 'package:flutter/material.dart';

class ExpansibleDetailCard extends StatelessWidget {
  const ExpansibleDetailCard(
      {required this.childdetailCard,
      required this.title1,
      required this.info1,
      required this.title2,
      required this.info2,
      required this.title3,
      required this.info3,
      super.key});

  final ChildDetailCard childdetailCard;
  final String title1;
  final String info1;
  final String title2;
  final String info2;
  final String title3;
  final String info3;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      elevation: 1,
      // margin: spacer.all.xxs,
      child: Padding(
        padding: spacer.all.xxs,
        child: ExpansionTile(
          backgroundColor: Colors.white,
          title: childdetailCard,
          children: <Widget>[
            Padding(
              padding: spacer.all.xxs,
              child: Row(
                children: <Widget>[
                  Text(title1),
                  const Spacer(),
                  Text(info1),
                ],
              ),
            ),
            Padding(
              padding: spacer.all.xxs,
              child: Row(
                children: <Widget>[
                  Text(title2),
                  const Spacer(),
                  Text(info2),
                ],
              ),
            ),
            Padding(
              padding: spacer.all.xxs,
              child: Row(
                children: <Widget>[
                  Text(title3),
                  const Spacer(),
                  Text(info3),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
