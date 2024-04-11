// ignore_for_file: deprecated_member_use

import 'package:accounting_pos_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

AppBar headerNav(GlobalKey<ScaffoldState> drawerKey) {
  bool enabled = true;
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 12),
      child: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white,),
        onPressed: () {
          if (enabled) {
            drawerKey.currentState?.openDrawer();
          }
        },
      ),
    ),
    title: Row(
      children: <Widget>[
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'TallyAssist',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.normal,
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
          style: TextStyle(
            fontSize: 14.0,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.green,),
          onPressed: () => _launchURL(),
        ),
        const DropDownMonths(),
      ],
    ),
    backgroundColor: tassistMenuBg,
  );
}

Future<void> _launchURL() async {
  const url = ''; // Update with your URL
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class DropDownMonths extends StatefulWidget {
  const DropDownMonths({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DropDownMonthsState createState() => _DropDownMonthsState();
}

class _DropDownMonthsState extends State<DropDownMonths> {
  String? selectedValue;

  final List<String> _months = <String>[
    '1 month',
    '3 months',
    '6 months',
    '1 year'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconEnabledColor: Colors.white,
      items: _months
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: tassistPrimaryBackground),
                ),
              ))
          .toList(),
      onChanged: (selectedMonth) {
        setState(() {
          selectedValue = selectedMonth;
        });
      },
      value: selectedValue,
      isExpanded: false,
      hint: Text(
        'Period',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: tassistWhite,
              fontSize: 12.0,
            ),
      ),
    );
  }
}
