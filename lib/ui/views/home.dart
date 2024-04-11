// ignore_for_file: unnecessary_null_comparison

import 'package:accounting_pos_project/theme/colors.dart';
import 'package:accounting_pos_project/theme/dimensions.dart';
import 'package:accounting_pos_project/theme/texts.dart';
import 'package:accounting_pos_project/ui/shared/drawer.dart';
import 'package:accounting_pos_project/ui/shared/header_nav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

var formatter = DateFormat('dd-MM-yyyy');

formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key, this.userId});

  final String? userId;

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  String timePeriod = 'Everything';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: drawerKey,
        appBar: headerNav(drawerKey),
        drawer: tassistDrawer(context),
        // //   bottomNavigationBar:
        // //   FloatingActionButton(
        // //     child: Icon(FontAwesomeIcons.fileInvoice),
        // //     backgroundColor: TassistPrimaryDarkButtonShadow,
        // //     onPressed:  () {Navigator.of(context).pushReplacement(
        // //     MaterialPageRoute(
        // //             builder: (context) => LedgerInputScreen()
        // //           )
        // // );
        // //       })
        //   ,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              const StatusBar(),
      
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  'Tally Dashboard',
                  style: secondaryListTitle,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                child: DashboardCard(
                  timePeriod: timePeriod,
                ),
                // decoration: myBoxDecorationTopBorder()
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                child: DashboardCard2(
                  timePeriod: timePeriod,
                ),
                // decoration: myBoxDecorationTopBorder()
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                child: DashboardCard3(
                  timePeriod: timePeriod,
                ),
                // decoration: myBoxDecorationTopBorder()
              ),
              Padding(
                padding: spacer.all.xs,
                child: const Text(
                  'View / जानकारी हेर्नुहोस् ',
                  style: secondaryListTitle,
                ),
              ),
              Padding(
                padding: spacer.x.xs,
                child: const FittedBox(
                  child: Row(
                    children: <Widget>[
                      ActionButton(
                          nepaliTitle: 'पार्टी',
                          icon: Icon(FontAwesomeIcons.listAlt),
                          title: 'Parties'),
                      /* ActionButton(Icon(FontAwesomeIcons.listAlt), LedgerScreen(),
                          'Parties', 'पार्टी'), */
      
                      ActionButton(
                          nepaliTitle: 'वाउचर',
                          icon: Icon(FontAwesomeIcons.fileInvoice),
                          title: 'Voucher'),
      
                      /* ActionButton(Icon(FontAwesomeIcons.fileInvoice),
                          VouchersHome(), 'Vouchers', 'वाउचर'), */
      
                      ActionButton(
                          nepaliTitle: 'स्टॉक',
                          icon: Icon(FontAwesomeIcons.warehouse),
                          title: 'Stock'),
      
                      /*  ActionButton(Icon(FontAwesomeIcons.warehouse),
                          StockScreen(), 'Stock', 'स्टॉक'), */
      
                      ActionButton(
                          nepaliTitle: 'सैटिंग्स',
                          icon: Icon(Icons.settings),
                          title: 'Settings'),
                      /* ActionButton(Icon(Icons.settings), SettingsScreen(),
                          'Settings', 'सैटिंग्स'), */
                    ],
                  ),
                ),
              ),
              //  Padding(
              //   padding: spacer.all.xs,
              //   child: Text('Create / नया बनाएँ', style: secondaryListTitle,),
              // ),
              // Padding(
              //   padding: spacer.x.xs,
              //   child: Row(
              //       children: <Widget>[
              //       ActionButton(Icon(FontAwesomeIcons.fileInvoice), LedgerInputScreen(), 'Invoice', 'बिल'),
              //       // ActionButton(Icon(FontAwesomeIcons.fileAlt), LedgerInputScreen(), 'Estimate','कच्चा'),
              //       // ActionButton(Icon(Icons.person_outline), CustomerInputScreen(), 'Party','पार्टी'),
              //       // ActionButton(Icon(Icons.add_shopping_cart), ProductInputScreen(), 'Product','उत्पाद'),
              //       ],
              //     ),
              // )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(
            FontAwesomeIcons.fileInvoice,
            color: Colors.white,
          ),
          label: const Text(
            'Invoice बनाउनुहोस्',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: tassistMenuBg,
          onPressed: () {
            /*  Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LedgerInputScreen(),
            )); */
          },
        ),
      ),
    );
  }
}

class StatusBar extends StatefulWidget {
  const StatusBar({super.key});

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
      color: tassistBgLightPurple,
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: const Row(
        children: <Widget>[
          Text(
            'Synced: ',
            style: TextStyle(fontSize: 12, color: tassistInfoGrey),
          ),
          Text(
            // _formatDate(companyData.lastSyncedAt),
            'data...',
            style: TextStyle(fontSize: 12, color: tassistMenuBg),
          ),
          Expanded(child: SizedBox(width: 20)),
          Text(
            'Last Entry: ',
            style: TextStyle(fontSize: 12, color: tassistInfoGrey),
          ),
          Text(
            // _formatDate(companyData.lastEntryDate),
            'data',
            style: TextStyle(fontSize: 12, color: tassistMenuBg),
          )
        ],
      ),
    );
  }
}

class DashboardCard extends StatefulWidget {
  final String timePeriod;

  const DashboardCard({super.key, required this.timePeriod});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: 70,
              child: InkWell(
                onTap: () {
                  /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => VouchersHome(),
                  )); */
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        /* formatIndianCurrency(
                                userDocument['total_sales'].toString()) ?? */
                        'Rs.1343433',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: tassistMainText,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        'Sales सेल्स ',
                        style:
                            secondaryListDisc.copyWith(color: tassistPrimary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Card(
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: 70,
                child: InkWell(
                    onTap: () {
                      /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => VouchersHome(),
                      )); */
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            // formatIndianCurrency(
                            /* userDocument['net_profit'].toString() ?? */ '700000',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: tassistMainText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            'Net Profit लाभ',
                            style: secondaryListDisc.copyWith(
                                color: tassistPrimary),
                          ),
                        ],
                      ),
                    )),
              ))
          // SimpleTimeSeriesChart.withSampleData(),
        ],
      ),
    );
  }
}

class DashboardCard2 extends StatefulWidget {
  const DashboardCard2({super.key, required this.timePeriod});

  final String timePeriod;

  @override
  State<DashboardCard2> createState() => _DashboardCard2State();
}

class _DashboardCard2State extends State<DashboardCard2> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: 70,
              child: InkWell(
                onTap: () {
                  /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => AccountsReceivableScreen(),
                  )); */
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        /* formatIndianCurrency(
                                userDocument['out_actual_rec'].toString()) ?? */
                        'Rs. 300000',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: tassistMainText,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        'Receivables लेन ',
                        style:
                            secondaryListDisc.copyWith(color: tassistPrimary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Card(
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: 70,
                child: InkWell(
                    onTap: () {
                      /*  Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => AccountsPayableScreen(),
                      )); */
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            /* formatIndianCurrency(userDocument['out_actual_pay']
                                    .toString()) ?? */
                            'Rs. 20000',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: tassistMainText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            'Payables देन',
                            style: secondaryListDisc.copyWith(
                                color: tassistPrimary),
                          ),
                        ],
                      ),
                    )),
              ))
          // SimpleTimeSeriesChart.withSampleData(),
        ],
      ),
    );
  }
}

class DashboardCard3 extends StatefulWidget {
  const DashboardCard3({required this.timePeriod, super.key});
  final String timePeriod;

  @override
  State<DashboardCard3> createState() => _DashboardCard3State();
}

class _DashboardCard3State extends State<DashboardCard3> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: 70,
              child: InkWell(
                onTap: () {
                  /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => AccountsReceivableScreen(),
                  )); */
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        // formatIndianCurrency(
                        /* userDocument['cash_in_hand'].toString() ?? */ 'Rs. 120000',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: tassistMainText,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        'Cash in Hand नकद',
                        style:
                            secondaryListDisc.copyWith(color: tassistPrimary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Card(
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: 70,
                child: InkWell(
                    onTap: () {
                      /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => AccountsPayableScreen(),
                      )); */
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            // formatIndianCurrency(
                            /* userDocument['cash_in_bank'].toString() ?? */ 'Rs. 200000',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: tassistMainText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            'Cash in Bank बैंक',
                            style: secondaryListDisc.copyWith(
                                color: tassistPrimary),
                          ),
                        ],
                      ),
                    )),
              ))
          // SimpleTimeSeriesChart.withSampleData(),
        ],
      ),
    );
  }
}

class ActionButton extends StatefulWidget {
  const ActionButton(
      {required this.nepaliTitle,
      required this.icon,
      required this.title,
      this.widget,
      super.key});
  final Icon icon;
  final Widget? widget;
  final String title;
  final String nepaliTitle;
  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        width: MediaQuery.of(context).size.width / 4.5,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: widget.icon,
                  iconSize: 30,
                  padding: const EdgeInsets.all(4.0),
                  color: Colors.grey[800],
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => widget,
                    ));
                  }),
              Text(
                widget.title,
                style: secondaryListDisc.copyWith(
                    fontSize: 14, color: tassistPrimary),
              ),
              Text(
                widget.nepaliTitle,
                style: secondaryListDisc.copyWith(
                    fontSize: 14, color: tassistPrimary),
              )
            ]),
      ),
    );
  }
}
