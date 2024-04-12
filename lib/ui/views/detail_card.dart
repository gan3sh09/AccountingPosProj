import 'package:accounting_pos_project/theme/dimensions.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    required this.title1,
    required this.info1,
    required this.info2,
    required this.info3,
    required this.info4,
    super.key,
  });

  final String title1;
  final String info1;
  final String info2;
  final String info3;
  final String info4;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: spacer.all.xs,
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text(title1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16.0,
                      )),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(info1, style: Theme.of(context).textTheme.bodyLarge),
                  Text(
                    info2,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(info3,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                  Text(info4, style: Theme.of(context).textTheme.bodyLarge)
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
