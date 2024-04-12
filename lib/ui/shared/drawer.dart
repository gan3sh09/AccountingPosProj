import 'package:accounting_pos_project/theme/colors.dart';
import 'package:accounting_pos_project/theme/dimensions.dart';
import 'package:accounting_pos_project/ui/views/account_payable_screen.dart';
import 'package:accounting_pos_project/ui/views/account_receivable_screen.dart';
import 'package:accounting_pos_project/ui/views/home.dart';
import 'package:accounting_pos_project/ui/views/ledger_screen.dart';
import 'package:accounting_pos_project/ui/views/stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Drawer tassistDrawer(BuildContext context) {
  return Drawer(
      child: ListView(
    children: <Widget>[
      DrawerHeader(
        decoration: const BoxDecoration(
          color: tassistMenuBg,
          shape: BoxShape.rectangle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 25.0,
              backgroundColor: tassistWhite,
              child: Icon(
                Icons.person_outline,
                color: tassistInfoGrey,
                size: 40.0,
              ),
            ),
            const SizedBox(
              width: 70,
            ),

            FittedBox(
              child: Text(
                'No email',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: tassistWhite,
                      fontSize: 14.0,
                    ),
              ),
            ),

            //  RaisedButton(
            //    color: TassistWhite,
            //    child:
            //    Row(children: <Widget>[
            //   Icon(FontAwesomeIcons.laptop),
            //   SizedBox(width: 20),
            //   Text('Get Tally Connector')

            //    ]),
            // onPressed: () => _launchURL(),)
          ],
        ),
      ),
      Padding(
        padding: spacer.all.xxs,
        child: Text('Reports', style: Theme.of(context).textTheme.bodyLarge),
      ),
      const DrawerItem(
        icon: Icons.dashboard,
        title: 'Home',
        onTap: HomeDashboardScreen(),
        color: tassistPrimaryBackground,
      ),
      const DrawerItem(
        icon: FontAwesomeIcons.rectangleList,
        title: 'Ledgers / Parties',
        onTap: LedgerScreen(),
        color: tassistPrimaryBackground,
      ),
      const DrawerItem(
        icon: Icons.call_received,
        title: 'Accounts Receivables',
        onTap: AccountsReceivableScreen(),
        color: tassistPrimaryBackground,
      ),
      const DrawerItem(
        icon: Icons.call_made,
        title: 'Accounts Payables',
        onTap: AccountsPayableScreen(),
        color: tassistPrimaryBackground,
      ),
      const DrawerItem(
        icon: FontAwesomeIcons.warehouse,
        title: 'Stock',
        onTap: StockScreen(),
        color: tassistPrimaryBackground,
      ),
      const DrawerItem(
        icon: FontAwesomeIcons.fileInvoice,
        title: 'Vouchers',
        onTap: HomeDashboardScreen(),
        color: tassistPrimaryBackground,
      ),
      const DrawerItem(
        icon: Icons.receipt,
        title: 'Make New Invoice',
        onTap: HomeDashboardScreen(),
        color: tassistPrimary,
      ),
      Padding(
        padding: spacer.all.xxs,
        child: Text('Specials', style: Theme.of(context).textTheme.bodyLarge),
      ),
      const DrawerItem(
        icon: Icons.lock,
        title: 'Bahi Khata',
        onTap: HomeDashboardScreen(),
        color: tassistMainText,
      ),
      const DrawerItem(
        icon: Icons.settings,
        title: 'Settings',
        onTap: HomeDashboardScreen(),
        color: tassistMainText,
      ),
      const SizedBox(
        height: 20.0,
      ),
      Padding(
        padding: spacer.y.xxs,
        child: InkWell(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: spacer.x.xs,
                child: const Icon(
                  Icons.lock_open,
                  color: tassistPrimaryBackground,
                ),
              ),
              Text(
                'Sign Out',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 16),
              ),
            ],
          ),
          onTap: () async {
            /* await _auth.signOut().then((_) {
              // Navigator.popUntil(context, );
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context) => new MyApp()),
                  ModalRoute.withName('/'));
            }); */
          },
        ),
      ),
    ],
  ));
}

class DrawerItem extends StatefulWidget {
  const DrawerItem(
      {required this.icon,
      required this.title,
      required this.onTap,
      required this.color,
      super.key});

  final IconData icon;
  final String title;
  final Widget onTap;
  final Color color;

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: tassistSuccess,
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => widget.onTap,
        ));
      },
      child: Padding(
        padding: spacer.y.xxs,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: spacer.x.xs,
              child: Icon(
                widget.icon,
                color: widget.color,
              ),
            ),
            Text(
              widget.title,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: widget.color, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

/* _launchURL() async {
  const url = '';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
} */
