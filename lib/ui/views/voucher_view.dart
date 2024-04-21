// ignore_for_file: deprecated_member_use

import 'package:accounting_pos_project/theme/colors.dart';
import 'package:accounting_pos_project/theme/dimensions.dart';
import 'package:accounting_pos_project/ui/shared/drawer.dart';
import 'package:accounting_pos_project/ui/views/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class VoucherView extends StatelessWidget {
  const VoucherView(
      {required this.voucherId, required this.partyGuid, super.key});

  final String partyGuid;
  final String voucherId;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

    return Scaffold(
      key: drawerKey,
      drawer: tassistDrawer(context),
      // Invoice PDF gets shared from here
      appBar: headerNavOtherVoucher(GlobalKey<ScaffoldState>(), context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: spacer.all.xxs,
              child: Text(
                'Party Name',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: spacer.all.xxs,
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Voucher #'),
                        Text('voucher number'),
                      ],
                    ),
                    /* Visibility(
                      visible: voucher.primaryVoucherType == "Sales",
                      child: InvoiceButton(
                        voucher: voucher,
                        company: company,
                        ledger: ledger,
                      ),
                    ), */
                  ]),
            ),
            Container(height: 3.0, color: tassistGray),
            Padding(
              padding: spacer.all.xxs,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: spacer.all.xxs,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: tassistBgLightPurple,
                    ),
                    child: const Text('Voucher Type'),
                  ),
                  // SizedBox(width: 20),
                  const Text('voucher.type'),
                ],
              ),
            ),
            Padding(
              padding: spacer.all.xxs,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('V. Amount',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 24.0, fontWeight: FontWeight.bold)),
                      const Text('Amount')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Voucher Date',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                      const Text('Date')
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: spacer.all.xxs,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Reference:'),
                ],
              ),
            ),
            Container(height: 3.0, color: tassistGray),
            const VoucherItemView(),

            const LedgerPartyView(),
            //  Container(
            //   height: 3.0,
            //   color: TassistGray
            // ),
            // Text('Total Invoice: ${voucher.amount}', style: Theme.of(context).textTheme.bodyText2,)
          ],
        ),
      ),
    );
  }
}

class LedgerPartyView extends StatelessWidget {
  const LedgerPartyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text('Ledger Summary'),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return const LedgerPartyTile();
            }),
        Container(height: 3.0, color: tassistGray),
      ],
    );
  }
}

class LedgerPartyTile extends StatelessWidget {
  const LedgerPartyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: const Text(
                'Ledger Name',
                overflow: TextOverflow.ellipsis,
              )),
          const Text('Amount'),
        ],
      ),
    );
  }
}

class VoucherItemView extends StatelessWidget {
  const VoucherItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text('Item Details'),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: spacer.y.xxs,
                child: const VoucherItemTile(),
              );
            }),
        Container(height: 3.0, color: tassistGray),
      ],
    );
  }
}

class VoucherItemTile extends StatelessWidget {
  const VoucherItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailCard(
      title1: 'Item Name',
      info1: 'Rate',
      info2: 'Tax Amount',
      info3: 'Amount',
      info4: 'discount',
    );
  }
}

AppBar headerNavOtherVoucher(
    GlobalKey<ScaffoldState> drawerkey, BuildContext context) {
  bool enabled = true;

  return AppBar(
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(Icons.picture_as_pdf),
      //     onPressed: () => viewPdf(context, voucher, company, ledger),
      //   )
      // ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            if (enabled) {
              Navigator.pop(context);
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => LedgerView(
              //       partyname: voucher.partyname,
              //       ledgerGuid: voucher.partyGuid,
              //     ),
              //   ),
              // );
            }
          },
        ),
      ),
      elevation: 0.7,
      title: Row(
        children: <Widget>[
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'TallyAssist',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                'Beta',
                style: TextStyle(
                  color: tassistWhite,
                  fontSize: 12,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            'Help?',
            style: TextStyle(fontSize: 14.0, letterSpacing: 1.0, color: Colors.white),
          ),
          IconButton(
              icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.green,),
              onPressed: () => _launchURL())
          // DropDownMonths(),
        ],
      ),
      backgroundColor: tassistMenuBg);
}

_launchURL() async {
  const url = 'https://api.whatsapp.com/send';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
