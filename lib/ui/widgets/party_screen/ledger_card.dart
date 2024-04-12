import 'package:accounting_pos_project/theme/colors.dart';
import 'package:accounting_pos_project/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LedgerCard extends StatelessWidget {
  const LedgerCard(
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
    return Column(
      children: [
        Container(
          decoration: ShapeDecoration(
              color: tassistInfoLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              )),
          child: Padding(
            padding: spacer.x.xxs,
            child: Text(
              'Debtor',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 12.0),
            ),
          ),
        ),
        Container(
          decoration: ShapeDecoration(
              color: tassistInfoLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              )),
          child: Padding(
            padding: spacer.x.xxs,
            child: Text(
              'Creditor',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 12.0),
            ),
          ),
        ),
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          elevation: 8.0,
          // margin: spacer.all.xxs,
          child: ExpansionTile(
            backgroundColor: Colors.white,
            subtitle: childdetailCard,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[
                  // _changeActiveStatus(),
                  //   SizedBox(width: 8.0,),
                  // _changeReceivables(),
                  // SizedBox(
                  //   width: 8.0,
                  // ),
                  // _changeCreditorDebtor(),
                  const Spacer(),

                  IconButton(
                      icon: const Icon(FontAwesomeIcons.whatsapp,color: Colors.green,),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(FontAwesomeIcons.bell),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Coming Soon!'),
                                content: Text(
                                  'Reminders are in the works, you will see them soon!',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text(
                                        "I'll wait :)",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: tassistPrimaryBackground),
                                      ))
                                ],
                              );
                            });
                      }),
                ]),
              ],
            ),
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
              ),
              // Padding(
              //   padding: spacer.all.xxs,
              //   child: Row(
              //     children: <Widget>[
              //       Text(title4),
              //       Spacer(),
              //       Text(info4),
              //     ],
              //   ),
              // ),
              TextButton(
                  onPressed: () {
                    /*  var partyname = ledgerItem.name;
                var ledgerGuid = ledgerItem.guid;
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LedgerView(
                          ledgerGuid: ledgerGuid,
                          partyname: partyname,
                        ))); */
                  },
                  child: Text(
                    'View more details',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: tassistMenuBg),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class ChildDetailCard extends StatelessWidget {
  const ChildDetailCard(
      {required this.title1,
      required this.info1,
      required this.info2,
      required this.info3,
      required this.info4,
      super.key});

  final String title1;
  final String info1;
  final String info2;
  final String info3;
  final String info4;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.35,
          child: Text(title1,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
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
    ]);
  }
}
